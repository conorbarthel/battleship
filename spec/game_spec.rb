require './lib/game'

RSpec.describe 'game' do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ships = [@cruiser, @submarine]
    @game = Game.new(@board, @ships)
  end

  describe "set up game" do
    it 'exists' do
      expect(@game).to be_a(Game)
    end

    it "has a board" do
      expect(@board).to be_a(Board)
    end

    it "has valid_coords" do
      expect(@game.valid_coords).to eq(@board.cells.keys)
    end

    it "prints welcome message" do
      expect(@game.welcome_message).to eq("Welcome to BATTLESHIP \n" "Enter p to play. Enter q to quit.")
    end
  end

  describe "cpu coords work" do
    it "cpu_cords exists" do
      expect(@board.valid_placement?(@cruiser, @game.get_cpu_coords(@game.ships[0]))).to eq(true)
    end
  end
end
