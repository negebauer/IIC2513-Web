module Camels
	class Camel
	  def initialize (name, id)
	    @name = name
	    @id = id
			@distance=[]
	  end

		def inspect()
			return str = "Nombre: #{@name}, id: #{@id}"
		end

	end
end
