class Project < ActiveRecord::Base
  belongs_to :user

  has_many :issues, dependent: :destroy
  has_many :labels, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :user, presence: true

  def <<(issue)
    issues << issue
  end

  def to_param
    name
  end
end
