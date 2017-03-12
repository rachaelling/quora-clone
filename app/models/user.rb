require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  #username validations
  validates :username, presence: true
  validates :username, uniqueness: true
  #email validations
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Please check the spelling of your email :)" }
  #password validations
  has_secure_password
  #can also add in 'clearance gem'
end
