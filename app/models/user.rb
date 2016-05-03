class User < ActiveRecord::Base

  validates :username,  presence: true
  validates :password,  presence: true
  validate :check_email_format

  def check_email_format
    if self.email == ""
        errors.add("email","Debe ingresar un email")
    else
      errors.add("email","Ingrese uno con el formato correcto") unless
      self.email && self.email.match("^[^@]+@[^@]+\.[^@]+$")
    end
  end


end
