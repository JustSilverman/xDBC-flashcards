require 'digest/md5'

class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :rounds
  validates :first_name, :last_name, :email, :password, :presence => true
  validates :email, :format => { :with => EMAIL_REGEX }, :uniqueness => true
  validates :password, :length => { :minimum => 6 }

  before_create :encrypt_password
  before_save   { self.email.downcase! }

  def name
    "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def authenticate(attempt)
    self if self.password == Digest::MD5.hexdigest(attempt)
  end

  private
  def encrypt_password
    self.password = Digest::MD5.hexdigest(self.password)
  end
end
