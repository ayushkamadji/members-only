class User < ApplicationRecord

  attr_accessor :remember_token

  validates :name, presence: true
  validates :email, presence: true, 
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true
  has_secure_password

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticate_token(type, token)
    if User.digest(token) == self.send("#{type}_digest")
      return self
    end
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest(string)
      Digest::SHA1.hexdigest(string)
    end
  end
end
