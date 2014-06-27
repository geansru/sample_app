class User < ActiveRecord::Base
  has_secure_password
  before_create :create_remember_token
  before_save :check_email
  validates :name,  presence: true, length: { maximum: 20, minimum: 4 }
#  VALID_EMAIL_REGEX = /\A([A-Za-z]+(\d|_|-|\+|[A-Za-z]|\.)*@[A-Za-z]+\.([A-Za-z]+.)*[A-Za-z]{2,3})\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{2,3}\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 8, maximum: 40 }

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  def check_email
    email.downcase!
  end
  def create_remember_token
    self.remember_token = User.encrypt( User.new_remember_token )
  end
end
