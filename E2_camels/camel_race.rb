module Camels
	class Camel_Race

	  attr_reader :camel_quantity, :camel_data, :race_data

	  def initialize()
	    @camel_quantity = ""
	    @camel_data = ""
	    @race_data = ""
	  end

	  def read_file
	    file = File.open("/Users/Nico/Dropbox/PUC/01 Cursos/2016-1/IIC2513 Tecnologías y Aplicaciones Web/IIC2513Web/E2_camels/carreras ejemplo v1.2/carrera_2_camellos.txt", "r")

	    count = 0
	    file.each_line do |line|
	      if count == 0
	        @camel_quantity = line
	      elsif count == 1
	        @camel_data = line
	      else
	        @race_data << line
	      end
	      count += 1
	    end
	    file.close
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
