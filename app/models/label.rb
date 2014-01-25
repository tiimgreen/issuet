class Label < ActiveRecord::Base
  belongs_to :project
  belongs_to :issue

  validates :name, presence: true, uniqueness: { scope: :project }
  validates :color,
            presence: true,
            uniqueness: { scope: :project },
            inclusion: { in: %w(default primary success warning danger info) }
  validates :project, presence: true
end
