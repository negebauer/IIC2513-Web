class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username,  presence: true
  validates :password,  presence: true, :on => :create
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def self.login(username, password)
    user = User.find_by_username(username).try(:authenticate, password)
    if username.blank?
      return nil, "Debes ingresar un usuario"
    elsif user.nil?
      return nil, "Usuario o clave incorrecto"
    elsif !user.active
      return nil, "Cuenta desactivada, contacta al admin"
    else
      return user, nil
    end
  end

  def active_toggle
    self.update(active: !self.active)
  end

end
