require './lib/cell'
class Board
  attr_reader :cells

  def initialize
    @cells = {
     "A1" => cell_1 = Cell.new("A1"),
     "A2" => cell_2 = Cell.new("A2"),
     "A3" => cell_1 = Cell.new("A3"),
     "A4" => cell_1 = Cell.new("A4"),
     "B1" => cell_1 = Cell.new("B1"),
     "B2" => cell_1 = Cell.new("B2"),
     "B3" => cell_1 = Cell.new("B3"),
     "B4" => cell_1 = Cell.new("B4"),
     "C1" => cell_1 = Cell.new("C1"),
     "C2" => cell_1 = Cell.new("C2"),
     "C3" => cell_1 = Cell.new("C3"),
     "C4" => cell_1 = Cell.new("C4"),
     "D1" => cell_1 = Cell.new("D1"),
     "D2" => cell_1 = Cell.new("D2"),
     "D3" => cell_1 = Cell.new("D3"),
     "D4" => cell_1 = Cell.new("D4")
    }
  end
end