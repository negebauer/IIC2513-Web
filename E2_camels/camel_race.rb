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

		attr_reader :camel_quantity, :camel_data, :race_data, :camels, :data_race, :winners

	  def initialize
	    @camel_quantity = ""
	    @camel_data = ""
	    @race_data = ""
			@camels = Hash.new
			@data_race = []
			@positions = Hash.new
			@winners = Hash.new
			@winner = []
			@points = Hash.new
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

		def process_winner
			camels = @camels.values
			camels.sort_by! { |camel| camel.total_time }
			camels.select! { |camel| camel.total_time == camels[0].total_time }
			@winner = camels
		end

		def empty_winners
			@winners = Hash.new
		end

		def empty_winners_lap(lap)
			@winners[lap] = {1 => [], 2 => [], 3 => []}
		end

		def number_of_winners(lap)
			sum = 0
			@winners[lap].keys.each { |key| sum += winners[lap][key].count }
			return sum
		end

		def process_winners
			camels = @camels.values
			empty_winners
			(1..5).each { |lap|
				empty_winners_lap(lap)
				position = 1
				last_camel_time = 0
				camels.sort_by! { |camel| camel.times[lap] }
				camels.each { |camel|
					if last_camel_time == 0 || camel.times[lap] <= last_camel_time
						last_camel_time = camel.times[lap]
						@winners[lap][position].push(camel)
					elsif position < 3
						if number_of_winners(lap) >= 3
							next
						end
						if @winners[lap][position].count >= 2
							position += 1
						end
						position += 1
						last_camel_time = camel.times[lap]
						@winners[lap][position].push(camel)
					else
						next
					end
				}
			}
		end

		def process_points
			camels = @camels.values
			camels.each { |camel| @points[camel] = 0 }
			(1..3).each { |lap|
				@winners[lap].keys.each { |position|
					camels = @winners[lap][position]
					points = 0
					if position == 1
						points = 6
					elsif position == 2
						points = 4
					elsif position == 3
						points = 1
					end
					camels.each { |camel|
						@points[camel] += points
					}
				}
			}
		end

		def camels_str
			str = "Camellos:\n"
			@camels.values.each { |camel| str += "#{camel.name}, #{camel.id}\n" }
			str += "\n"
			return str
		end

		def laps_str
			str = "Resultado vueltas:\n"
			@winners.keys.each { |lap|
				str += "Vuelta #{lap}\n"
				@winners[lap].keys.each { |position|
					if @winners[lap][position][0].nil?
						next
					end
					str += "#{position}"
					@winners[lap][position].each { |camel|
						if camel != @winners[lap][position][0]
							str += ","
						end
						str += " #{camel.name}"
					}
					str += " (#{@winners[lap][position][0].times[lap]} seg)\n"
				}
				str += "\n"
			}
			return str
		end

		def winner_str
			if @winner.count == 1
				return "Ganador del Derby del Gran Camejockey: #{@winner[0].name}\n\n"
			else
				return "Ganadores del Derby del Gran Camejockey:\n#{@winner.map { |camel| "#{camel.name}\n" }}\n\n"
			end
		end

		def points_str
			str = "Puntajes:\n"
			@points.keys.each { |camel| str += "#{camel.name}: #{@points[camel]}\n" }
			return str
		end

	end
end
