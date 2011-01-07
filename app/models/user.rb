class User < ActiveRecord::Base
  
  has_many :posts
  
  attr_accessor :password
  
  before_save :create_hashed_password
  after_save :clear_password
  
  def self.authenticate(username="", password="")
    user = User.find_by_username(username)
    if user && user.password_match?(password)
    # if user
      return user
    else
      return false
    end
  end
  
  def password_match?(password="")
    hashed_password == User.hash_with_salt(password, salt)
    # hashed_password == User.hash(password)
  end
  
  def self.hash(password="")
    Digest::SHA1.hexdigest(password)
  end
  
  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end
  
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
  
  private
  
  def create_hashed_password
    if not password.blank?
      if salt.blank?
        self.salt = User.make_salt(username)
      end
      self.hashed_password = User.hash_with_salt(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
  
end
