# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if User.first.nil?
  # no hay usuarios
  #names = ["david", "nico"]
  #names.uniq.map{|n| n.downcase }.each do |name|
  #  User.create(username: name, password: '12345678', admin: false)
  #end
  User.create(username: "nico", password: '1234', admin: true, email: "negebauer@uc.cl", active: true)
  User.create(username: "david", password: '5678', admin: false, email: "daruz@uc.cl", active: true)
  User.create(username: "diego", password: 'qwerty', admin: false, email: "dacasas@uc.cl", active: false)
end
