# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Si descomentas la linea siguiente puedes resetear la base de datos de usuarios en heroku
# User.all.each { |e| User.delete(e)  }
if User.first.nil?
    User.create(username: 'admin', password: 'admin', admin: true, email: 'admin@nidastore.com', active: true)
    User.create(username: 'nico', password: '123456', admin: false, email: 'negebauer@uc.cl', active: true)
    User.create(username: 'david', password: '123456', admin: true, email: 'daruz@uc.cl', active: true)
    User.create(username: 'diego', password: '123456', admin: false, email: 'dacasas@uc.cl', active: false)
end

# Si descomentas la linea siguiente puedes resetear la base de datos de productos en heroku
Product.all.each { |e| Product.delete(e)  } 
if Product.first.nil?
    # Computadores
    Product.create(name: 'Macbook Pro', price: 2000000, stock: 2, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Hp Aio 18-5616la', price: 289990, stock: 2, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Hp Aio Pavilion', price: 449990, stock: 2, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Pc Olidata Intel Core 2 ', price: 69000, stock: 5, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Pc Lenovo Slim ', price: 99000, stock: 6, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Pc Gamer Jvtpc ', price: 599990, stock: 11, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Pc Gamer Quad Core ', price: 549990, stock: 9, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Pc Gamer Intel Core I7 ', price: 880000, stock: 21, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Pc Gamer Amd Athlon ', price: 551500, stock: 25, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Pc Dell Core 2 ', price: 89990, stock: 42, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Imac Intel Core I5', price: 660000, stock: 32, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Pc Jvtpc Annu Amd ', price: 1499999, stock: 52, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'HP Intel Core I5 ', price: 173684, stock: 12, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Lenovo Dual Core ', price: 63000, stock: 3, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Hp Allinone Ms220la ', price: 60000, stock: 1, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Macbook Air 11', price: 699990, stock: 17, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Macbook Air 13', price: 839000, stock: 30, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'iMac 27 18gb RAM', price: 1000000, stock: 25, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Chromebook enchulado', price: 120000, stock: 14, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Hp Starwars III', price: 449990, stock: 13, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Hp Envy 13 6gb', price: 659990, stock: 11, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
    Product.create(name: 'Notebook Acer Switch 2 ', price: 169990, stock: 2, description: 'Computador bonito y elegante que toda persona quiere tener', family: 1, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")

    # Desodorante
    Product.create(name: 'Desodorante Tommy Hilfiger', price: 8000, stock: 5, description: 'Atrae a todas las mujeres como un galan', family: 2, promotion: false, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")

    # Promociones
    Product.create(name: 'Notebook vaio + axe chocolate', price: 80_000, stock: 3, description: "Computador básico para tareas sencillas al igual que este util desodorante", family: 0, promotion: true, uuid: SecureRandom.uuid, image: "http://bit.ly/28Yt987")
end
