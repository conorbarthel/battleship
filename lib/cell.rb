require './lib/ship.rb'

class Cell
  attr_reader :coordinate, :ship, :fired_at

#Initialize coorinate as argument, and sets fired_at to false, and ship to nil
  def initialize(coordinate)
    @coordinate = coordinate
    @fired_at = false
    @ship = nil
  end

#Determines if the cell object has a ship on it
  def empty?
    @ship.nil?
  end

#Adds a ship to the cell
  def place_ship(ship)
    @ship = ship
  end

#Determines if the cell has been fired on
  def fired_upon?
    @fired_at == true
  end

#Fired_at is reassigned to true, and if the cell has a ship then remove health
#from that ship
  def fire_upon
    @fired_at = true
    if empty? == false
      @ship.hit
    end
  end

#Renders individual cells
  def render(display = false)
    @display = display
      if display == true && empty? == false && fired_upon? == false && ship.sunk? == false
        #Prints S if display is true, the cell isn't empty, it wasn't fired
        #upon, and the ship isn't sunk
        "S"
      elsif fired_upon? && empty?
        #Prints M if the cell is fired upon and is empty
        "M"
      elsif fired_upon? && empty? == false && ship.sunk? == false
        #Prints H if the cell is fired upon, has a ship in it, and isn't sunk
        "H"
      elsif fired_upon? && ship.sunk?
        #Prints X if the cell is fired upon and the ship is sunk
        "X"
      else
        #Prints . if none of the above statments are true
        "."
    end
  end
end
