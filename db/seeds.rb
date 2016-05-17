# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.all.each { |e| User.delete(e)  }
if User.first.nil?
  User.create(username: "admin", password: "admin", admin: true, email: "admin@nidastore.com", active: true)
  User.create(username: "nico", password: "123456", admin: false, email: "negebauer@uc.cl", active: true)
  User.create(username: "david", password: "123456", admin: false, email: "daruz@uc.cl", active: true)
  User.create(username: "diego", password: "123456", admin: false, email: "dacasas@uc.cl", active: false)
end

# Product.all.each { |e| Product.delete(e)  }
if Product.first.nil?
  Product.create(name: "MacBook Pro", price: 2000000, stock: 2, description: "Computador bonito y elegante que toda persona quiere tener", family: 1, promotion: false)
  Product.create(name: "Desodorante Tommy Hilfiger", price: 8000, stock: 5, description: "Atrae a todas las mujeres como un galan", family: 2, promotion: false)
  Product.create(name: "Notebook vaio + axe chocolate", price: 80000, stock: 3, description: "Computador básico para tareas sencillas al igual que este util desodorante", family: 0, promotion: true)
end
