module Camels
	class Camel

		attr_reader :name, :id, :distances
		attr_writer :distances

	  def initialize(name, id)
	    @name = name
	    @id = id
			@distances = []
	  end

		def inspect
			str = "- Nombre: #{@name}, id: #{@id} -"
			# str += "\nDistances: #{@distances}"
			return str
		end

		def laps_time
			# Devolvamos aqui un array (hash mejor?) con cuanto demoro en cada vuelta
			p Camel_Race.total_distance
		end

	end
end
