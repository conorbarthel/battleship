class Ship
  attr_reader :name, :length, :health
#Initializes name and length parameters
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  # When the length of a ship is equal to zero return true, that it did sink
  def sunk?
    @health == 0
  end
  # Subtract one length from the ship that got hit
  def hit
    @health -= 1
  end
end
