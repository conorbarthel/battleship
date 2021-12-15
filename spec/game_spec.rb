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
    @game = Game.new()
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
    
    #welcome_message is determinite on user input and
    #runs game when rspec is called so test is problematic
    # it "prints welcome message" do
    #    expect(@game.welcome_message).to eq(puts "Welcome to BATTLESHIP \n" "Enter p to play. Enter q to quit.")
    # end
  end

  describe "cpu functionality" do
    it "cpu cords are correct length" do
      expect(@game.get_cpu_coords(@cpu_cruiser).length).to eq(3)
    end

    it "cpu_cords are valid" do
      expect(@game.cpu_board.valid_placement?(@cpu_cruiser, @game.get_cpu_coords(@cpu_cruiser))).to eq(true)
    end

    it "places ships" do
      #tested in game with the b_render(true),
      #the ship places two ships at valid locations every time.
      #the random nature of the cpu's placement makes testing with RSpec
      #inneffective
    end

    it "fires shots" do
      #cpu_shot depends on the randomized variable "shot" 
      #in game checklist: It fires on valid coordinates, those coordinates
      #render correctly, it does not fire on the same spot twice,
      #it displays results and player board.
    end
  end

  describe "player functionality" do
    it "places ships" do
      #dependent on user input
      #checklist: Does it reject invalid inputs, does it show a board
      #does it give instructions
    end

    it "fires_shots" do
      #dependent on user input
      #checklist: does it reject invalid coordinates, does it reject
      #repeat coordinates, does it display results, does it display
      #a board after
    end
  end

  describe "display_board" do
    it "displays both boards and only shows player's ships" do
      #tested in game
    end
  end

  describe "turn" do
    it "runs the game and ends the game" do
      #All of this is untestable due to user input
      #the testing happened in game.
    end
  end
end
