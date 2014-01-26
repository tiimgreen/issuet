class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  has_many :issues, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login) # rubocop:disable AssignmentInCondition, LineLength
      where(conditions).where([
        'lower(username) = :value OR lower(email) = :value',
        { value: login.downcase }
      ]).first
    else
      where(conditions).first
    end
  end
end
