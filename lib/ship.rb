class Ship
  attr_reader :name, :length
#Initializes name and length parameters
  def initialize(name, length)
    @name = name
    @length = length
  end
  # Assigns the method health equal to the length of the ship class
  def health
    health = length
  end
end
