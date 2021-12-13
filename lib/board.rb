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


  def get_letters(cords)
    get_letters = split_cords(cords).map do |cord|
      cord.first
    end
  end


  def get_numbers(cords)
    get_numbers = split_cords(cords).map do |cord|
  def last(cords)
    last = split_cords(cords).map do |cord|
      cord.last.to_i
    end
  end

  def num_consec?(cords)
    get_numbers(cords).each_cons(2) do |pair|
    last(cords).each_cons(2) do |pair|
     return false if pair[0].next != pair[1]
    end
    true
  end

  def alpha_consec?(cords)
    get_letters(cords).each_cons(2) do |pair|
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
    if num_consec?(coordinates) && get_letters(coordinates).all?(get_letters(coordinates)[0])
      true
    elsif alpha_consec?(coordinates) && get_numbers(coordinates).all?(get_numbers(coordinates)[0])
      true
    else
      false
    end
  end
#renders board
  def render_b(show = false)
    @show = show
    puts "  1 2 3 4 \n" +
    "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
    "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
    "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
    "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
    if show == true
    puts  "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
      "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
      "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
      "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
    end
  end
end
