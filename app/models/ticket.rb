class Ticket < ActiveRecord::Base
  belongs_to :project, foreign_key: :project_id
  has_many :ticket_tags
  has_many :tags, through: :ticket_tags

  validates :name, presence: true, length: { minimum: 5 }
  validates :status, inclusion: { in: %w(new blocked in_progress fixed) }, presence: true
end
