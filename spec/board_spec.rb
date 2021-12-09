require './lib/board'
RSpec.describe "Board" do
  # it "is a Board" do
  #   board = Board.new
  #
  #   expect(board).to be_a(Board)
  # end
  #
  # it "returns a hash of 16 Cells" do
  #   board = Board.new
  #
  #   expect(board.cells).to be_a(Hash)
  #   expect(board.cells.size).to eq(16)
  # end

  decribe '#valid_cordinate?' do
    it "returns true or false if valid" do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to be(true)
      expect(board.valid_coordinate?("A5")).to be(false)
    end
  end

end
