
class User < ActiveRecord::Base

  #password validations / user authentication
  has_secure_password

  #username validations
  validates :username, presence: true, uniqueness: true

  #email validations
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Please check the spelling of your email :)" }


  #can also add in 'clearance gem'
  has_many :questions, dependent: :destroy #once i delete a user, the related questions will be destroyed
end
