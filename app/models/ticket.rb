class Ticket < ActiveRecord::Base
  scope :filter_by_project, ->(project_id) { where project_id: project_id }
  scope :filter_by_status, ->(status) { where status: status }
  scope :filter_by_tag, ->(tag_id) { joins(:ticket_tags).where(tag_id: tag_id) }

  belongs_to :project, foreign_key: :project_id

  belongs_to :user, foreign_key: :user_id, optional: true

  has_many :ticket_tags, dependent: :destroy
  has_many :tags, through: :ticket_tags

  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }
  validates :status, inclusion: { in: %w[new blocked in_progress fixed] }, presence: true
end
