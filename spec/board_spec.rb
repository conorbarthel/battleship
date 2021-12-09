require './lib/board'
RSpec.describe "Board" do

  it "exists" do
    board = Board.new

    expect(board).to be_a(Board)
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
