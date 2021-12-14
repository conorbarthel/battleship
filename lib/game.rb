require './lib/board.rb'
require './lib/ship.rb'
require 'pry'
class Game
  attr_reader :cpu_board, :player_board, :ship_1, :ship_2, :valid_coords
#We are going to need a player_board and a cpu_board
#Will have to update our methods to take arguments to
#perform action on correct board
  def initialize(cpu_board, player_board, ship_1, ship_2)
    @cpu_board = cpu_board
    @player_board = player_board
    @ship_1 = ship_1
    @ship_2 = ship_2
    @valid_coords = @cpu_board.cells.keys
  end
#welcome_message will print at top of loop
  def welcome_message
    puts "Welcome to BATTLESHIP" +
   "Enter p to play. Enter q to quit."
    play
  end

  def get_ship_name(board)
    board.cells.values.ship
  end

  def play
    input = gets.chomp
    if input == "p"
      p "turn"
    elsif input == "q"
      welcome_message
    elsif input == "stop"
      puts "break"
    else
      puts "Invalid input"
    end
    #welcome_message
  end

  def display_boards
    #renders cpu_boards
  end
# gets valid coords for CPU
  def get_cpu_coords(ship)
    cpu_coords = []
    coords = ship.length.times do
      cpu_coords << @valid_coords.sample
    end
    if cpu_board.valid_placement?(ship, cpu_coords)
      return cpu_coords
    else
      return get_cpu_coords(ship)
    end
  end
#cpu places ship_1
  def cpu_placement(ship)
      cpu_board.place(ship, get_cpu_coords(ship))
  end
#player places ship. Include explaination of how to play
#also should render empty cpu_board for player to reference.
#when propted to add a ship it should tell the player
#how long the ship is
#argument for render will be true so player can see their ship_1
  def player_placement(ship_1)

  end
#computer shot and results
  def computer_shot
    shot = @valid_coords.delete(@valid_coords.sample)
    cpu_board.cells[shot].fire_upon
    cpu_board.render_b #might want to take this linie out should the cpu be rendering?
    if cpu_board.cells[shot].empty?
      puts "My shot #{shot} is a miss"
    elsif cpu_board.cells[shot].empty? == false
      puts "My shot #{shot} is a Hit!"
    elsif cpu_board.cells[shot].empty? == false && cpu_board.cells[shot].ship.sunk?
      puts "My shot #{shot} is a Hit! I sunk your BATTLESHIP!"
    end
  end
#gets player's input and checks if valid. Valid coords will need to
#remove the player choice after it has been made so that they
#cannot repeat coords. This should also print player results
  def player_shot

  end

#display_cpu_board, player_shot, computer shot
#executes all functions of turn, will loop until all ship_1 are sunk for a player
#displays a message about who won
  def turn
    display_boards
    player_shot
    computer_shot
    # if
    # end
  end
end
cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)
cpu_board = Board.new
player_board = Board.new
game = Game.new(cpu_board, player_board, cruiser, submarine)
p cpu_board.render_b
#game.play
#p game.valid_coords
#p game.get_cpu_coords(game.ship_1[0])
# game.play?
#fginp game.cpu_placement(game.ship_1)
#p game.computer_shot
#game.computer_shot
#game.computer_shot
# p game.computer_shot
# p game.computer_shot
# p game.computer_shot
# p game.computer_shot
# p game.computer_shot
# p game.computer_shot
# p game.computer_shot
# p game.computer_shot
# p game.computer_shot
# p game.computer_shot
# p game.computer_shot
#p game.valid_coords
