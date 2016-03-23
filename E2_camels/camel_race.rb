module Camels
	require_relative 'camel'

	class Camel_Race

	  attr_reader :camel_quantity, :camel_data, :race_data, :camels, :data_race

	  def initialize()
	    @camel_quantity = ""
	    @camel_data = ""
	    @race_data = ""
			@camels = []
			@data_race=[]
	  end

		def inspect()
			str = "Carrera con " + @camels.count.to_s + " camellos\n"
			@camels.each { |cammel|
				str += cammel.inspect + "\n"
			}
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
				camel = Camels::Camel.new(camel_name, camel_id)
		    add_camel_distance(camel)
				@camels.push(camel)
			}
		end

		def add_camel_distance(camel)
			#primero se debe ejecutar get_data!!!!
			@data_race.each do  |datarace|
				data_race1= datarace.split(",")
				if data_race1[0].nil? || data_race1.nil?
					return
				end
				if data_race1[0]==camel.id
						camel.distance.push(data_race1[1].strip.to_f)
				end
			end
		end

	  def get_data()
	    @data_race = @race_data.scan(/\w+\s*,\s*[0-9\.]+/) # { |match|  }
		end
	  #REVISA SI ESTO ESTA BIEN, SEGUN YO SI XD
	end
end
