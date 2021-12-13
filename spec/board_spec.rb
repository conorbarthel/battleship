require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'
require 'pry'

RSpec.describe "Board" do
  describe "is a valid board" do
    it "exists" do
      board = Board.new
      expect(board).to be_a(Board)
    end

    it "is a hash" do
      board = Board.new
      expect(board.cells).to be_a(Hash)
      end

    it "has 16 keys and values" do
      board = Board.new
      expect(board.cells.length).to eq(16)
    end

    it "values are cell objects" do
      board = Board.new
      expect(board.cells.values.sample).to be_a(Cell)
    end
  end

  describe "valid_coordinate?" do
    it "valid_coordinate? checks if cordinates are valid" do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to be(true)
      expect(board.valid_coordinate?("D4")).to be(true)
      expect(board.valid_coordinate?("A5")).to be(false)
      expect(board.valid_coordinate?("E1")).to be(false)
      expect(board.valid_coordinate?("A22")).to be(false)
    end
  end

  describe "Placing ships" do
    it "places" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      cell_1.ship
      cell_2.ship
      cell_3.ship
      expect(cell_3.ship).to eq(cell_2.ship)
      expect(cell_1.empty?).to eq(false)
    end
  end

  describe "split_cords" do
    it 'seperates letters and numbers' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.split_cords(["A1", "A2"])).to eq([["A", "1"], ["A", "2"]])
    end
  end

  describe "get_letters" do
    it 'returns an array of strings of letters' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.get_letters(["A1", "A2"])).to eq(["A", "A"])
    end
  end

  describe "get_numbers" do
    it 'returns an array of numbers' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.get_numbers(["A1", "A2"])).to eq([1, 2])
    end
  end

  describe "alpha_consec?" do
    it 'checks if cordinates letters are consecutive' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.alpha_consec?(["A1", "A2"])).to eq(false)
      expect(board.alpha_consec?(["A1", "B1"])).to eq(true)
    end
  end

  describe "num_consec?" do
    it 'checks if cordinates letters are consecutive' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.num_consec?(["A1", "A2"])).to eq(true)
      expect(board.num_consec?(["A1", "B1"])).to eq(false)
    end
  end

  describe "overlapping_ship?" do
    it "checks if ships are overlapping" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.overlapping_ship?(["A1", "B1"])).to eq(false)
      board.place(cruiser, ["A1", "A2", "A3"])
      expect(board.overlapping_ship?(["A1", "B1"])).to eq(true)
    end
  end

  describe "valid?" do
    it "checks if coordinates exist on board" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid?(["A1", "B1"])).to eq(true)
      expect(board.valid?(["A11", "B1"])).to eq(false)
    end
  end

  describe "valid_placement?" do
    it "placment is valid" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
        expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end

  describe "rendering the board" do
    it "checks for board" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      expect(board.render_b(true)).to eq(puts "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      board.place(cruiser, ["A1", "A2", "A3"])
      expect(board.render_b(true)).to eq(puts "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end
end
