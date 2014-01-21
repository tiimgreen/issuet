class Issue < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :state, inclusion: { in: %w(open closed) }
end
