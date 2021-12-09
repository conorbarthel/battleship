require './lib/board'
RSpec.describe "Board" do
  it "is a Board" do
    board = Board.new

    expect(board).to be_a(Board)
  end

  it "returns a hash of 16 Cells" do
    board = Board.new
  end

end
