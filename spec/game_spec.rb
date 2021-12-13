require './lib/game'

RSpec.describe 'game' do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ships = [@cruiser, @submarine]
    @game = Game.new(@board, @ships)
  end

  it 'exists' do
    expect(@game).to be_a(Game)
  end

  it "has a board" do
    expect(@board).to be_a(Board)
  end
end
