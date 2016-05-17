# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.all.delete
if User.first.nil?
  User.create(username: "admin", password: "admin", admin: true, email: "admin@nidastore.com", active: true)
  User.create(username: "nico", password: "123456", admin: false, email: "negebauer@uc.cl", active: true)
  User.create(username: "david", password: "123456", admin: false, email: "daruz@uc.cl", active: true)
  User.create(username: "diego", password: "123456", admin: false, email: "dacasas@uc.cl", active: false)
end

if Product.first.nil?
  # Product.create()
end
