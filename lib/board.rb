require './lib/cell.rb'
require './lib/ship.rb'
class Board
  attr_reader  :cells

  def initialize
    @cells = {
     "A1" => Cell.new("A1"),
     "A2" => Cell.new("A2"),
     "A3" => Cell.new("A3"),
     "A4" => Cell.new("A4"),
     "B1" => Cell.new("B1"),
     "B2" => Cell.new("B2"),
     "B3" => Cell.new("B3"),
     "B4" => Cell.new("B4"),
     "C1" => Cell.new("C1"),
     "C2" => Cell.new("C2"),
     "C3" => Cell.new("C3"),
     "C4" => Cell.new("C4"),
     "D1" => Cell.new("D1"),
     "D2" => Cell.new("D2"),
     "D3" => Cell.new("D3"),
     "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(cord)
    @cells.keys.any?(cord)
  end


  def place(ship, coords)
    coords.each do |coord|
      if coord == @cells[coord].coordinate
        @cells[coord].place_ship(ship)
      end
    end
  end

  def split_cords(cords)
  split_elements = cords.map do |cord|
    cord.split("")
    end
    split_elements
  end

  def first(cords)
    first = split_cords(cords).map do |cord|
      cord.first
    end
  end

  def last(cords)
    last = split_cords(cords).map do |cord|
      cord.last.to_i
    end
  end

  def num_consec?(cords)
    last(cords).each_cons(2) do |pair|
     return false if pair[0].next != pair[1]
    end
    true
  end

  def alpha_consec?(cords)
    first(cords).each_cons(2) do |pair|
     return false if pair[0].next != pair[1]
    end
    true
  end

  def overlapping_ship?(coordinates)
    coordinates.any? do |coord|
      if !(@cells[coord].empty?)
        return true
      end
      #binding.pry
    end
    return false
  end

  def valid?(coordinates)
    coordinates.any? do |coord|
      if !(valid_coordinate?(coord))
        return false
      end
    end
    return true
  end


  def valid_placement?(ship, coordinates)
    return false if ship.length != coordinates.size
    return false if valid?(coordinates) != true
    return false if overlapping_ship?(coordinates) == true
    if num_consec?(coordinates) && first(coordinates).all?(first(coordinates)[0])
      true
    elsif alpha_consec?(coordinates) && last(coordinates).all?(last(coordinates)[0])
      true
    else
      false
    end
  end

  def render_b#(display = false)
    #@display = display
    #if display == true
      puts row1 = "  1 2 3 4\n"
      puts row2 = "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render}\n"
      puts row3 = "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render}\n"
      puts row4 = "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render}\n"
      puts row5 = "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render}"
    #end
  end
end
