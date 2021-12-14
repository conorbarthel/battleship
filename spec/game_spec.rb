require './lib/game'
require 'pry'
RSpec.describe 'game' do
  before(:each) do
    @cpu_board = Board.new
    @player_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @game = Game.new(@cpu_board, @player_board, @cruiser, @submarine)
  end
  describe "set up game" do
    it 'exists' do
      expect(@game).to be_a(Game)
    end

    it "has a two boards" do
      expect(@cpu_board).to be_a(Board)
      expect(@player_board).to be_a(Board)
    end

    it "has has access to board's valid_coords" do
      expect(@game.valid_coords).to eq(["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"])
    end

    it "prints welcome message" do
      expect(@game.welcome_message).to eq(puts "Welcome to BATTLESHIP \n" "Enter p to play. Enter q to quit.")
    end
  end

  describe "cpu functionality" do
    it "cpu cords are correct length" do
      expect(@game.get_cpu_coords(@cruiser).length).to eq(3)
    end
    it "cpu_cords are valid" do
      expect(@game.cpu_board.valid_placement?(@cruiser, @game.get_cpu_coords(@cruiser))).to eq(true)
    end
    xit "places ships" do
      @game.cpu_placement(@game.ship_1)

      expect(@cpu_board.cells.values.any? do |cell|
        #binding.pry
        if cell.ship.to be_a(Ship)
        end
      end).to eq(true)
    end
  end


end
