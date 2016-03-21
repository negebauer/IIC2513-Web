require_relative 'camel_race'

a = Camels::Camel_Race.new()
a.read_file("/Users/Nico/Dropbox/PUC/01 Cursos/2016-1/IIC2513 Tecnologías y Aplicaciones Web/IIC2513Web/E2_camels/carreras ejemplo v1.2/carrera_2_camellos.txt")
# puts a.instance_variable_get(:@camel_quantity)
# puts a.camel_quantity
# puts a.camel_data
# puts a.race_data
a.get_data

# puts a.camels
