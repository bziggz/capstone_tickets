class Comment < ActiveRecord::Base
  belongs_to :user, foreign_key: :creator
  belongs_to :ticket, foreign_key: :ticket_id

  validates :body, presence: true
end