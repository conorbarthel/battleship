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
  # def welcome_message
  #   puts "Welcome to BATTLESHIP"
  #   puts "Enter p to play. Enter q to quit."
  #   play
  # end
  #
  # def play
  #   input = gets.chomp
  #   if input == "p"
  #     p "turn"
  #     place_cruiser
  #   elsif input == "q"
  #     welcome_message
  #   else
  #     puts "Invalid input"
  #   end
  # end

  def quit?
    if user_input == "q"
    else
      puts "Invalid input"
    end
  end
#bottom of loop if quit is true loop ends
  def choice
    if play? == true
      #will execute the turns until one player sinks other's ships
    elsif quit? == true
      welcome_message
    end
  end

  def display_board(board1, board2)
    puts "===COMPUTER BOARD==="
    puts board1.render_b
    puts "===PLAYER BOARD==="
    puts board2.render_b(true)
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
    board.place(ship, get_cpu_coords(ship))
  end
#player places ship. Include explaination of how to play
#also should render empty board for player to reference.
#when propted to add a ship it should tell the player
#how long the ship is
#argument for render will be true so player can see their ships

def place_instructions
  puts "The computer has placed their ships"
  puts "Now it is your turn to lay out your ships"
  puts "The cruiser is 3 units long and the submarine is 2 units"
  @board.render_b
end

  def place_ship(ship)
    # Asks player to put in ships coords
    puts "The #{ship.name} is #{ship.length} spaces. Enter #{ship.length} coords \n" +
    "ex: #{get_cpu_coords(ship)}"
    player_place = gets.chomp
    player_coord = player_place.split(" ")

    if @board.valid_placement?(ship, player_coord)
      @board.place(ship, player_coord)
      return board.render_b(true)
    else
      puts "Those are invalid coordinates. Try again: \n"
      place_ship(ship)
    end
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
    puts "Enter a coordinate to shoot at: \n"
    shot = gets.chomp
    return puts "Invalid coordinates. Please try again: \n" if @valid_coords.any?(shot) == false
  end
#display_board, player_shot, computer shot
#executes all functions of turn, will loop until all ships are sunk for a player
#displays a message about who won
  def turn

  end

  def results

  end
end
cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)
board1 = Board.new
board2 = Board.new
game = Game.new(board, [cruiser, submarine])
#game.play
# game.place_instructions
# game.place_ship(cruiser)
#p game.valid_coords
#p game.get_cpu_coords(game.ships[0])
# game.play?
#fginp game.cpu_placement(game.ships)
#p game.computer_shot
#game.computer_shot
#game.computer_shot
# p game.place_ship(cruiser)
p game.display_board(board1, board2)

# p game.place_ship(submarine)
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
