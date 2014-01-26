class Issue < ActiveRecord::Base
  before_create :populate_number

  belongs_to :user
  belongs_to :project

  has_many :labels
  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :project }
  validates :body, presence: true
  validates :state, inclusion: { in: %w(open closed) }
  validates :user, presence: true
  validates :project, presence: true

  def <<(label)
    labels << label
  end

  def populate_number
    if project
      project.increment!(:issue_sequence)
      self[:number] = project.issue_sequence
    end
  end

  def to_param
    number
  end
end
