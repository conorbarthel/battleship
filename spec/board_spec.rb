require './lib/board'
RSpec.describe "Board" do
  

  decribe '#valid_cordinate?' do
    it "returns true or false if valid" do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to be(true)
      expect(board.valid_coordinate?("A5")).to be(false)
    end
  end

end
