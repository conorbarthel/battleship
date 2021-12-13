require './lib/board.rb'
require './lib/ship.rb'
require 'pry'
class Game
  attr_reader :board, :ships, :valid_coords, :input
#We are going to need a player_board and a cpu_board
#Will have to update our methods to take arguments to
#perform action on correct board
  def initialize(board, ships)
    @board = board
    @ships = ships
    @valid_coords = @board.cells.keys
  end
#welcome_message will print at top of loop
  def welcome_message
    puts "Welcome to BATTLESHIP" +
    puts "Enter p to play. Enter q to quit."
    play
  end

  def play
    input = gets.chomp
    if input == "p"
      p "turn"
    elsif input == "q"
      welcome_message
    else
      puts "Invalid input"
    end
    welcome_message
  end

#   def quit?
#     if user_input == "q"
#     else
#       puts "Invalid input"
#     end
#   end
# #bottom of loop if quit is true loop ends
#   def choice
#     if play? == true
#       #will execute the turns until one player sinks other's ships
#     elsif quit? == true
#       welcome_message
#     end
#   end

  def display_board
    #renders boards
  end
# gets valid coords for CPU
  def get_cpu_coords(ship)
    cpu_coords = []
    coords = ship.length.times do
      cpu_coords << @valid_coords.sample
    end
    if board.valid_placement?(ship, cpu_coords)
      return cpu_coords
    else
      return get_cpu_coords(ship)
    end
  end
#cpu places ships
  def cpu_placement(ship)
    ship.each do
      board.place(ship, get_cpu_coords(ship))
    end
  end
#player places ship. Include explaination of how to play
#also should render empty board for player to reference.
#when propted to add a ship it should tell the player
#how long the ship is
#argument for render will be true so player can see their ships
  def player_placement(ships)

  end
#computer shot and results
  def computer_shot
    shot = @valid_coords.delete(@valid_coords.sample)
    board.cells[shot].fire_upon
    board.render_b
    if board.cells[shot].empty?
      puts "My shot #{shot} is a miss"
    elsif board.cells[shot].empty? == false
      puts "My shot #{shot} is a Hit!"
    elsif board.cells[shot].empty? == false && board.cells[shot].ship.sunk?
      puts "My shot #{shot} is a Hit! I sunk your BATTLESHIP!"
    end
  end
#gets player's input and checks if valid. Valid coords will need to
#remove the player choice after it has been made so that they
#cannot repeat coords. This should also print player results
  def player_shot

  end

#display_board, player_shot, computer shot
#executes all functions of turn, will loop until all ships are sunk for a player
#displays a message about who won
  def turn

  end
end
cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)
board = Board.new
game = Game.new(board, [cruiser, submarine])
game.play
#p game.valid_coords
#p game.get_cpu_coords(game.ships[0])
# game.play?
#fginp game.cpu_placement(game.ships)
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
