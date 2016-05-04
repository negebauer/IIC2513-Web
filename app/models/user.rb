class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token

  validates :username,  presence: true
  validates :password,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                  format: { with: VALID_EMAIL_REGEX }


  def self.login(username, password)
    user = User.where(username: username).first
    if name.blank?
      return nil, "Debes ingresar un usuario"
    elsif user.nil?
      return nil, "Usuario desconocido"
    elsif !user.active
      return nil, "Cuenta desactivada, contacta al admin"
    elsif password != user.password
      return nil, "La clave esta mal"
    else
      return user, nil
    end
  end

  def active_toggle
    self.update(active: !self.active)
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
end
