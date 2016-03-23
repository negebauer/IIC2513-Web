require_relative 'camel_race'

# Si nos llaman de terminal usamos el archivo que nos pasan ahi
dir = ARGV[0]
if dir.nil?
  # Si corremos desde nuestro IDE ruby preferido (Atom <3)
  dir = __dir__ + "/carreras ejemplo v1.3/carrera_6_camellos_corregida_2.txt"
end

camel_race = Camels::Camel_Race.new()
camel_race.read_file(dir)
camel_race.get_raw_data
camel_race.process_data

# camel_race.camels.each { |cammel| p cammel }
p camel_race
p camel_race.lap_places
