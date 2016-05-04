class User < ActiveRecord::Base

  validates :username,  presence: true
  validates :password,  presence: true
  #validate :check_email_format
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

end
