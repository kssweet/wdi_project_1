class User < ActiveRecord::Base
  has_secure_password
  has_many :newsstories
   # attr_accessor :email, :password, :password_confirmation

  validates_uniqueness_of :email
end
