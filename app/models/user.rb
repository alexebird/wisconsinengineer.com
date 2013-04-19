require 'digest/sha2'

class User < ActiveRecord::Base
  has_many :contributors
  has_many :articles
  has_many :issues

  validates_presence_of :email, :name, :password
  validates_uniqueness_of :email
  validates_length_of :password, :minimum => 6

  before_create do |user|
    if user.new_record?
      user.salt = User.gen_salt
      user.password = User.salt_password(user.password, user.salt)
    end
  end

  # Use this method instead of password=() to change a user's password.  This method will do
  # salting, where as password=() will not.
  #
  def change_password(new_pass)
    self.salt = User.gen_salt
    salted_pass = User.salt_password(new_pass, self.salt)
    self.password = salted_pass
  end

  class << self
    def salt_password(password, salt)
      Digest::SHA2.hexdigest(password + salt)
    end

    def gen_salt
      Time.now.to_s + rand(12442345233).to_s
    end

    def find_by_login(email, password)
      user = User.first(:conditions => {:email => email})
      return nil unless user
      if user.password == User.salt_password(password, user.salt)
        return user
      else
        return nil
      end
    end
  end
end
