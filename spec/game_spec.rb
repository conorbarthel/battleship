require './lib/game'
require 'pry'
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
      expect(@game.welcome_message).to eq(puts "Welcome to BATTLESHIP \n" "Enter p to play. Enter q to quit.")
    end
  end

  describe "cpu coords work," do
    it "cpu cords exists" do
      expect(@game.get_cpu_coords(@game.ships[0])).to be_a(Array)
    end
    it "cpu_cords are valid" do
      expect(@board.valid_placement?(@cruiser, @game.get_cpu_coords(@game.ships[0]))).to eq(true)
    end
    xit "places ships" do
      @game.cpu_placement(@game.ships)

      expect(@game.board.cells.values.any?()).to include(@cruiser)
    end
  end


end
