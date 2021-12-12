require 'pry'
class Board
  attr_reader  :cells

  def initialize(cells)
    @cells = {
     "A1" = Cell.new("A1"),
     "A2" = Cell.new("A2"),
     "A3" = Cell.new("A3"),
     "A4" = Cell.new("A4"),
     "B1" = Cell.new("B1"),
     "B2" = Cell.new("B2"),
     "B3" = Cell.new("B3"),
     "B4" = Cell.new("B4"),
     "C1" = Cell.new("C1"),
     "C2" = Cell.new("C2"),
     "C3" = Cell.new("C3"),
     "C4" = Cell.new("C4"),
     "D1" = Cell.new("D1"),
     "D2" = Cell.new("D2"),
     "D3" = Cell.new("D3"),
     "D4" = Cell.new("D4")
    }
  end

  def get_keys
    @cells.keys
  end

  def valid_coordinate?(cord)
    get_keys.any?(cord)
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
    last(cords).each_cons(2) do |two_things|
     return false if two_things[0].next != two_things[1]-1
    end
    true
  end

  def alpha_consec?(cords)
    first(cords).each_cons(2) do |two_things|
     return false if two_things[0].next != two_things[1]
    end
    true
  end

<<<<<<< HEAD
  def valid_placement?(ship, cordinates)
    cords = split_cords(cordinates)
    if ship.length != cordinates.size
      false
    elsif !alpha_consec?(cords) || !num_consec?(cords)
      false
    elsif alpha_consec?(cords) && last(cords).all?(last(cords)[0])
      true
    elsif num_consec?(cords) && first(cords).all?(first(cords)[0])
=======
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
>>>>>>> 8987e7339575693ca569dbcffc0cf925912b2796
      true
    end
  end
<<<<<<< HEAD

  def render(display = false)
    @display = display
    if display = true
      board_rend = "  1 2 3 4
      \nA #{@cells["A1"]} #{@cells["A2"]} #{@cells["A3"]} #{@cells["A4"]}
      \nB #{@cells["B1"]} #{@cells["B2"]} #{@cells["B3"]} #{@cells["B4"]}
      \nC #{@cells["C1"]} #{@cells["C2"]} #{@cells["C3"]} #{@cells["C4"]}
      \nD #{@cells["D1"]} #{@cells["D2"]} #{@cells["D3"]} #{@cells["D4"]}"
    end
    board_rend
  end
=======
>>>>>>> 8987e7339575693ca569dbcffc0cf925912b2796
end
