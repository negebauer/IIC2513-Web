module Camels
	class Camel

		attr_reader :name, :id, :distances, :times
		attr_writer :distances#, total_time

	  def initialize(name, id)
	    @name = name
	    @id = id
			@distances = []
			@times = Hash.new
	  end

		def inspect
			str = "Nombre: #{@name}, id: #{@id}"
			# str += "\nDistances: #{@distances}"
			str += "\nTimes: #{@times}"
			str += "\nTotal time: #{total_time}"
			return str
		end

		def total_time
			return @times[5]
		end

		def generate_laps_time
			lap_distance = Camel_Race.lap_distance.to_f
			lap = 1
			current_distance = 0.0
			current_time = 0
			@distances.each { |distance|
				current_time += 1
				current_distance += distance
				if current_distance >= lap_distance
					@times[lap] = current_time
					lap += 1
					current_distance -= lap_distance
				end
			}
		end

	end
end
