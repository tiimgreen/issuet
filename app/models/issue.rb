class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :state, inclusion: { in: %w(open closed) }
  validates :user, presence: true
  validates :project, presence: true
end
