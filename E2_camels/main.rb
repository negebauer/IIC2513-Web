require_relative 'camel_race'

# Si nos llaman de terminal usamos el archivo que nos pasan ahi
dir = ARGV[0]
if dir.nil?
  # Si corremos desde nuestro IDE ruby preferido (Atom <3)
  dir = __dir__ + "/carreras ejemplo v1.3/carrera_2_camellos.txt"
end

a = Camels::Camel_Race.new()
a.read_file(dir)
# puts a.instance_variable_get(:@camel_quantity)
 puts a.camel_quantity
 puts a.camel_data
# puts a.race_data
a.get_data
puts a.camels
# puts a.camels
