require './lib/game'
require 'pry'
RSpec.describe 'game' do
  before(:each) do
    @cpu_cruiser = Ship.new("CPU_Cruiser", 3)
    @cpu_submarine = Ship.new("CPU_Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @cpu_board = Board.new(@cpu_cruiser, @cpu_submarine)
    @player_board = Board.new(@player_cruiser, @player_submarine)
    @game = Game.new(@cpu_board, @player_board)
  end

  describe "initialize" do
    it 'exists' do
      expect(@game).to be_a(Game)
    end

    it "has a two boards" do
      expect(@cpu_board).to be_a(Board)
      expect(@player_board).to be_a(Board)
    end

    it "has has access to board's valid_coords" do
      expect(@game.cpu_valid_coords).to eq(["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"])
    end

    describe "welcome message" do
      it "prints welcome message" do
        expect(@game.welcome_message)
      end
    end
    # xit "prints welcome message" do
    #   expect(@game.welcome_message).to eq(puts "Welcome to BATTLESHIP \n" "Enter p to play. Enter q to quit.")
    # end
  end

  # describe "cpu functionality" do
  #   it "cpu cords are correct length" do
  #     expect(@game.get_cpu_coords(@cpu_cruiser).length).to eq(3)
  #   end
  #   it "cpu_cords are valid" do
  #     expect(@game.cpu_board.valid_placement?(@cpu_cruiser, @game.get_cpu_coords(@cpu_cruiser))).to eq(true)
  #   end
  #   xit "places ships" do
  #     @game.cpu_placement(@game.cpu_board.ship_1)
  #     binding.pry
  #
  #     expect(@game.cpu_board.cells.values).to eq(@cpu_cruiser)
  #   end
  # end


end
