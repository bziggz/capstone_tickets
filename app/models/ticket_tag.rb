class TicketTag < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :tag
  private
    
end
