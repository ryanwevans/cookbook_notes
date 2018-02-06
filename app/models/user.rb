class User < ActiveRecord::Base
  include ActiveRecord::Validations
  has_many :cookbooks
  has_many :notes
  has_secure_password
  validates_presence_of :username, :email, :password

  def slug
  	self.username.slugify
  end

  def self.find_by_slug(slug)
    User.all.detect{|user| user.slug == slug}
  end

end
