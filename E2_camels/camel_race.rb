module Camels
	require_relative 'camel'

	class Camel_Race

		@@total_distance = 3210
		@@lap_distance = @@total_distance / 5

		def Camel_Race.total_distance
			return @@total_distance
		end

		def Camel_Race.lap_distance
			return @@lap_distance
		end

		attr_reader :camel_quantity, :camel_data, :race_data, :camels, :data_race

	  def initialize
	    @camel_quantity = ""
	    @camel_data = ""
	    @race_data = ""
			@camels = Hash.new
			@data_race = []
			@positions = Hash.new
	  end

		def inspect
			str = "Carrera con #{@camels.count.to_s} camellos\n"
			@camels.keys.each { |key| str += "#{@camels[key].inspect}\n" }
			return str
		end

	  def read_file(dir)
	    file = File.open(dir, "r")
	    count = 0
	    file.each_line do |line|
	      if count == 0
	        @camel_quantity = line
	      elsif count == 1
	        @camel_data = line
					create_cammels
	      else
	        @race_data << line
	      end
	      count += 1
	    end
	    file.close
	  end

		def create_cammels
			camels_with_id = @camel_data.split(";")
			camels_with_id.each { |camel_id|
				camel_id_array = camel_id.split(",")
				if camel_id_array[0].nil? || camel_id_array[1].nil?
					return
				end
				camel_name = camel_id_array[0].strip
				camel_id = camel_id_array[1].strip
				if @camels[camel_id].nil?
					camel = Camels::Camel.new(camel_name, camel_id)
					@camels[camel_id] = camel
				end
			}
		end


	  def get_raw_data
	    @data_race = @race_data.scan(/\w+\s*,\s*[0-9\.]+/) # { |match|  }
		end

		def process_data
			if @data_race.empty?
				return
			end
			@data_race.each do |race|
				race = race.split(",")
				if race.empty?
					return
				end
				id = race[0].strip
				distance = race[1].strip.to_f
				if !@camels[id].nil?
					@camels[id].distances.push(distance)
				end
			end
			@camels.keys.each { |key| camels[key].generate_laps_time }
		end

		def camel_win
			camels = @camels.values
			camels.sort_by! { |camel| camel.total_time }
			camels.select! { |camel| camel.total_time == camels[0].total_time }
			if camels.count == 1
				return "Ganador del Derby del Gran Camejockey: #{camels[0].name}"
			else
				return "Ganadores del Derby del Gran Camejockey:\n#{camels.map { |camel| "#{camel.name}\n" }}"
			end
		end

		def sort_camels_places
			camels = @camels.values
			(1..5).each { |lap|
				position = 1
				camels.sort_by! { |camel| camel.times[lap] }[0..2]
				current_winners = [nil, camels[0]]
				camels[1..2].each { |camel|
					if camel.total_time == current_winners[position].total_time
					end
				}
			}
		end

		def lap_places
			camels = @camels.values
			str = ""
			(1..5).each { |lap|
				tontera = []
				posicion = 1
				camels.sort_by! { |camel| camel.times[lap] }
				camels[0].position[lap]=1
				tontera.push(camels[0])
				camels.each {|camello|
						posicion = 1
						camels.each {|camello2|
							if !tontera.include?(camello2)
								if camello.times[lap] == camello2.times[lap]
									posicion += 1
									camello2.position[lap] = camello.position[lap]
								else
									posicion += 1
									camello2.position[lap] = posicion
								end
								tontera.push(camello)
							end
						}
				}
				posicion += 1
				str += "Vuelta #{lap}:\n"
				str += "#{camels[0].position[lap].to_s}° lugar: #{!camels[0].nil? ? camels[0].name : "No hay"}\n"
				str += "#{camels[1].position[lap].to_s}° lugar: #{!camels[1].nil? ? camels[1].name : "No hay"}\n"
				str += "#{camels[2].position[lap].to_s}° lugar: #{!camels[2].nil? ? camels[2].name : "No hay"}\n"
			}
			return str
		end

	end
end
