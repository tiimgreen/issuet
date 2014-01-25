class Label < ActiveRecord::Base
  belongs_to :project
  belongs_to :issue

  validates :name, presence: true, uniqueness: { scope: :project }
  validates :color,
            presence: true,
            uniqueness: { scope: :project },
            format: { with: /(?<=#)(?<!^)(\h{6}|\h{3})/ }
  validates :project, presence: true
end
