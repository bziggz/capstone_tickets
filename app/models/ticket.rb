class Ticket < ActiveRecord::Base
  belongs_to :project, foreign_key: :project_id

  validates :status, inclusion: { in: %w(new blocked in_progress fixed) }
end
