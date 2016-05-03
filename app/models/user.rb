class User < ActiveRecord::Base

  validates :username,  presence: true
  validates :password,  presence: true
  #validate :check_email_format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                  format: { with: VALID_EMAIL_REGEX }


end
