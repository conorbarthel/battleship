require './lib/board.rb'
require './lib/ship.rb'
require 'pry'
class Game
  attr_reader :cpu_board, :player_board, :cpu_valid_coords, :player_valid_coords
#We are going to need a player_board and a cpu_board
#Will have to update our methods to take arguments to
#perform action on correct board
  def initialize(cpu_board, player_board)
    @cpu_board = cpu_board
    @player_board = player_board
    @cpu_valid_coords = @cpu_board.cells.keys
    @player_valid_coords = @player_board.cells.keys
  end

  def welcome_message
    puts "Welcome to BATTLESHIP! " +
    "Enter p to play. Enter q to quit."
    play
  end

  def play
    input = gets.chomp
    if input == "p"
      set_up(player_board, cpu_board)
    elsif input == "q"
      welcome_message
    elsif input == "stop"
      puts "Scram"
    else
      puts "Invalid input"
    end
    welcome_message
  end

  def set_up(player_board, cpu_board)
    display_board(player_board, cpu_board)
    cpu_placement(cpu_board.ship_1)
    cpu_placement(cpu_board.ship_2)
    place_instructions
    player_placement(player_board.ship_1)
    player_placement(player_board.ship_2)
    turn(player_board, cpu_board)
  end


  def turn(player_board, cpu_board)
    player_shot
    cpu_shot
    if player_board.ship_1.sunk? && player_board.ship_2.sunk? || cpu_board.ship_1.sunk? && cpu_board.ship_2.sunk?
      puts "Game over"
      welcome_message
    end
    turn(player_board, cpu_board)
  end

  def display_board(p_board, c_board)
    puts "===COMPUTER BOARD==="
    puts c_board.render_b
    puts "===PLAYER BOARD==="
    puts p_board.render_b(true)
  end

  def player_shot
    valid_choices = @player_valid_coords
    puts "Enter a coordinate to shoot at: \n"
    shot = gets.chomp
    cpu_board.cells[shot].fire_upon

    if @player_valid_coords.any?(shot) == false
       puts "Invalid coordinates. Please try again: \n"
       player_shot
    elsif cpu_board.cells[shot].empty?
      puts "Your shot #{shot} is a miss \n"
    elsif cpu_board.cells[shot].empty? == false
      puts "Your shot #{shot} is a Hit! \n"
    elsif cpu_board.cells[shot].empty? == false && cpu_board.cells[shot].ship.sunk?
      puts "Your shot #{shot} is a Hit! You sunk my BATTLESHIP! \n"
    end
  
    puts "COMPUTER BOARD"
    cpu_board.render_b(true)
  end

# gets valid coords for CPU
  def get_cpu_coords(ship)
    cpu_coords = []
    coords = ship.length.times do
      cpu_coords << @cpu_valid_coords.sample
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

  def cpu_shot
    shot = @cpu_valid_coords.delete(@cpu_valid_coords.sample)
    player_board.cells[shot].fire_upon
    if player_board.cells[shot].empty?
      puts "My shot #{shot} is a miss \n" +
      ""
    elsif player_board.cells[shot].empty? == false
      puts "My shot #{shot} is a Hit! \n" +
      ""
    elsif player_board.cells[shot].empty? == false && player_board.cells[shot].ship.sunk?
      puts "My shot #{shot} is a Hit! I sunk your BATTLESHIP! \n" +
      ""
    end
    puts "PLAYER BOARD"
    player_board.render_b(true)
  end

  def place_instructions
    puts "The computer has placed their ships"
    puts "Now it is your turn to lay out your ships"
    puts "The cruiser is 3 units long and the submarine is 2 units"
    @player_board.render_b
  end

  def player_placement(ship)
    # Asks player to put in ships coords
    puts "The #{ship.name} is #{ship.length} spaces. Enter #{ship.length} coords \n" +
    "ex: #{get_cpu_coords(ship).join(" ")}"
    player_place = gets.chomp
    player_coord = player_place.split(" ")

    if @player_board.valid_placement?(ship, player_coord)
      @player_board.place(ship, player_coord)
      return player_board.render_b(true)
    else
      puts "Those are invalid coordinates. Try again: \n"
      player_placement(ship)
    end
  end
end
#computer shot and results
#gets player's input and checks if valid. Valid coords will need to
#remove the player choice after it has been made so that they
#cannot repeat coords. This should also print player results

#display_board, player_shot, computer shot
#executes all functions of turn, will loop until all ships are sunk for a player

#displays a message about who won

cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)
cpu_board = Board.new(cruiser, submarine)
player_board = Board.new(cruiser, submarine)
game = Game.new(cpu_board, player_board)

game.welcome_message
