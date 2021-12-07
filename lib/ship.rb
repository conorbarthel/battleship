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
  # When the length of a ship is equal to zero return true, that it did sink
  def sunk?
    if @length == 0
      return true
    else
      return false
    end
  end
  # Subtract one length from the ship that got hit
  def hit
    x = @length
    @length = x - 1
    return @length
  end
end
