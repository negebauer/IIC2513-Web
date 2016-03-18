class Camel
  @@cammels = {}

  def self.cammels
    @@cammels
  end

  def initialize (name, id)
    @name = name
    @id = id
    @@camels[@id] = self
  end
end
