require './lib/board.rb'
require './lib/ship.rb'
require 'pry'
class Game
  attr_reader :cpu_board, :player_board, :cpu_valid_coords, :player_valid_coords

  def initialize()
    p_cruiser = Ship.new("Cruiser", 3)
    c_cruiser = Ship.new("CCruiser", 3)
    p_submarine = Ship.new("Submarine", 2)
    c_submarine = Ship.new("SSubmarine", 2)
    @cpu_board = Board.new(c_cruiser, c_submarine)
    @player_board = Board.new(p_cruiser, p_submarine)
    # @cpu_board = cpu_board
    # @player_board = player_board
    @cpu_valid_coords = @cpu_board.cells.keys
    @player_valid_coords = @player_board.cells.keys
  end

  def new_game
    initialize
    welcome_message
  end

  def welcome_message
    puts "Welcome to BATTLESHIP! " +
    "Enter p to play. Enter q to quit."
    input = gets.chomp
    if input == "p"
      set_up(player_board, cpu_board)
    elsif input == "q"
      welcome_message
    elsif input == "stop"
      puts "Scram"
    else
      puts "Invalid input"
      welcome_message
    end
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
    until player_board.ship_1.sunk? && player_board.ship_2.sunk? || cpu_board.ship_1.sunk? && cpu_board.ship_2.sunk? do
      player_shot
      cpu_shot
    end
    if player_board.ship_1.sunk? && player_board.ship_2.sunk?
      puts "You loose Game over"
    elsif cpu_board.ship_1.sunk? && cpu_board.ship_2.sunk?
      puts "You Win!"
    end
    new_game
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
    shot = gets.chomp.upcase
    until player_valid_coords.any?(shot) do
       puts "Invalid coordinates. Please try again: \n"
       !(shot = gets.chomp.upcase)
    end
    @player_valid_coords.delete(shot)
    if cpu_board.cells[shot].empty?
      puts "Your shot #{shot} is a miss \n"
    elsif cpu_board.cells[shot].empty? == false && cpu_board.cells[shot].ship.sunk?
      puts "Your shot #{shot} is a Hit! You sunk my BATTLESHIP! \n"
    elsif cpu_board.cells[shot].empty? == false
      puts "Your shot #{shot} is a Hit! \n"
    end
    cpu_board.cells[shot].fire_upon

    puts "COMPUTER BOARD \n "
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
    puts "PLAYER BOARD \n"
    player_board.render_b(true)
  end

  def place_instructions
    puts "The computer has placed their ships"
    puts "Now it is your turn to lay out your ships"
    puts "The cruiser is 3 units long and the submarine is 2 units"
    player_board.render_b
  end

  def player_placement(ship)
    # Asks player to put in ships coords
    puts "The #{ship.name} is #{ship.length} spaces. Enter #{ship.length} coords \n" +
    "ex: #{get_cpu_coords(ship).join(" ")}"
    player_place = gets.chomp.upcase
    player_coord = player_place.split(" ")
    if player_board.valid_placement?(ship, player_coord) == false
      puts "Those are invalid coordinates. Try again: \n"
      player_placement(ship)
    elsif player_board.valid_placement?(ship, player_coord)
      player_board.place(ship, player_coord)
      return player_board.render_b(true)
    end
  end
end
