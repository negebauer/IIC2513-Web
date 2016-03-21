module Camels
	require_relative 'camel'

	class Camel_Race

	  attr_reader :camel_quantity, :camel_data, :race_data, :camels

	  def initialize()
	    @camel_quantity = ""
	    @camel_data = ""
	    @race_data = ""
			@camels = []
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
					add_cammel_data(line)
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
				@camels.push(camel)
			}
		end

		def add_cammel_data(line)
			# data = line.split(",")
			# id = data[0].strip
			# yards = data[1].strip.to_i
			# puts "Data:"
			# puts id
			# puts yards
		end

	  def get_data()
	    data = @race_data.scan(/\w+\s*,\s*[0-9\.]+/) # { |match|  }
	    puts data
	  end
	end
end


# a = Camels::Camel_Race.new()
# a.read_file
# # puts a.instance_variable_get(:@camel_quantity)
# puts a.camel_quantity
# puts a.camel_data
# # puts a.race_data
# a.get_data
