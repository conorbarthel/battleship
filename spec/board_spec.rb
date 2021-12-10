require './lib/board'
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

    xit "validates_cordinates" do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to be(true)
      expect(board.valid_coordinate?("D4")).to be(true)
      expect(board.valid_coordinate?("A5")).to be(true)
      expect(board.valid_coordinate?("E1")).to be(true)
      expect(board.valid_coordinate?("A22")).to be(false)
    end

    xit "validates_placements" do
      board = Board.new

      expect(board)
    end

  end
end
