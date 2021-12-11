require './lib/cell'
class Board
  attr_reader  :cells

  def initialize
    @cells = {
     "A1" => cell_1 = Cell.new("A1"),
     "A2" => cell_2 = Cell.new("A2"),
     "A3" => cell_3 = Cell.new("A3"),
     "A4" => cell_4 = Cell.new("A4"),
     "B1" => cell_5 = Cell.new("B1"),
     "B2" => cell_6 = Cell.new("B2"),
     "B3" => cell_7 = Cell.new("B3"),
     "B4" => cell_8 = Cell.new("B4"),
     "C1" => cell_9 = Cell.new("C1"),
     "C2" => cell_10 = Cell.new("C2"),
     "C3" => cell_11 = Cell.new("C3"),
     "C4" => cell_12 = Cell.new("C4"),
     "D1" => cell_13 = Cell.new("D1"),
     "D2" => cell_14 = Cell.new("D2"),
     "D3" => cell_15 = Cell.new("D3"),
     "D4" => cell_16 = Cell.new("D4")
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

  def valid_placement?(ship, cordinates)
    if ship.length != cordinates.size
      false
    elsif num_consec?(cordinates) && first(cordinates).all?(first(cordinates)[0])
      true
    elsif alpha_consec?(cordinates) && last(cordinates).all?(last(cordinates)[0])
      true
    else
      false
    end
    #binding.pry
  end
end

# elsif cordinates.uniq!.size != cordinates.size
#   false
# elsif alpha_consec?(cordinates) == false || num_consec?(cordinates) == false
#   false
#cords = split_cords(cordinates)
# if cordinates.each do |cord|
#   !(valid_coordinate?(cord))
# end
