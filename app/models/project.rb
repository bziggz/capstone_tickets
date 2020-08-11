class Project < ActiveRecord::Base
  has_many :tickets, dependent: :delete_all
  validates :name, presence: true, length: { minimum: 5 }, uniqueness: true
end
