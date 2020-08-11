class Project < ActiveRecord::Base
  has_many :tickets
  validates :name, presence: true, length: { minimum: 3 }
  private
    
end
