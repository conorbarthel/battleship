require './lib/ship.rb'
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
  def place_ship(ship) #Might need to be @cell = ship for later work
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
#renders individual cells
  def render(display = false)
    @display = display
      if display == true && empty? == false && fired_upon? == false && ship.sunk? == false
        "S"
      elsif fired_upon? && empty?
        "M"
      elsif fired_upon? && empty? == false && ship.sunk? == false
        "H"
      # elsif fired_upon? == false
      #   var = "."
      elsif fired_upon? && ship.sunk?
        "X"
      else
        "."
    end
  end
end
