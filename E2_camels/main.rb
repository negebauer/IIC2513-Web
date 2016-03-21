require_relative 'camel_race'
require_relative 'camel'

a = Camels::Camel_Race.new()
a.read_file
# puts a.instance_variable_get(:@camel_quantity)
puts a.camel_quantity
puts a.camel_data
# puts a.race_data
a.get_data
