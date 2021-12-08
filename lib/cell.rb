#~/cell.rb
class Cell
  attr_reader :coordinate, :ship, :fired_at
#initialize variables to be accessed elsewhere
  def initialize(coordinate)
    @coordinate = coordinate
    @fired_at = false
    @ship = nil
  end
#determines if the cell object has a ship on it
  def empty?
    @ship.nil?
  end
#adds a ship to the cell
  def place_ship(ship)
    @ship = ship
  end
#determines if the cell has been fired on
  def fired_upon?
    @fired_at == true
  end
#if cell has been fired on determine if ship is present and if so remove health
#from ship. Either way reassign fired_at to be true
  def fire_upon
    @fired_at = true
    if empty? == false
      @ship.hit
    end
  end

end
