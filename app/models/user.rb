class User < ActiveRecord::Base
  before_save :check_email
  validates :name,  presence: true, length: { maximum: 20, minimum: 4 }
#  VALID_EMAIL_REGEX = /\A([A-Za-z]+(\d|_|-|\+|[A-Za-z]|\.)*@[A-Za-z]+\.([A-Za-z]+.)*[A-Za-z]{2,3})\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{2,3}\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  private
  def check_email
    self.email = email.downcase
  end
end
