class User < ActiveRecord::Base
  has_secure_password
  
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true
  validates :password, confirmation: true, length: { minimum: 3 }, presence: true
  private
    
end
