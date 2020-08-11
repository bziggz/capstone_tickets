class Ticket < ActiveRecord::Base
  belongs_to :project, foreign_key: :project_id

  validates :name, presence: true, length: { minimum: 5 }
  validates :status, inclusion: { in: %w(new blocked in_progress fixed) }, presence: true
end
