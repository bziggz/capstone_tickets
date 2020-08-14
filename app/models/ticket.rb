class Ticket < ActiveRecord::Base
  belongs_to :project, foreign_key: :project_id

  belongs_to :user, foreign_key: :user_id, optional: true

  has_many :ticket_tags
  has_many :tags, through: :ticket_tags

  has_many :comments, dependent: :delete_all

  validates :name, presence: true, length: { minimum: 5 }
  validates :status, inclusion: { in: %w(new blocked in_progress fixed) }, presence: true
end
