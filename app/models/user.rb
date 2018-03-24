class User < ActiveRecord::Base
  include ActiveRecord::Validations
  has_many :cookbooks
  has_many :notes
  has_secure_password
  validates_presence_of :username, :email, :password
end
