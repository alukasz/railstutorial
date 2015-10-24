class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  attr_accessor :remember_token

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_secure_password

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password(remember_digest).is_password(remember_token)
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end
end
