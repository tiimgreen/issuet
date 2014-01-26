class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue

  validates :body, presence: true
  validates :user, presence: true
  validates :issue, presence: true
end
