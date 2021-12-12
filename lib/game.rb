require './lib/board.rb'
require './lib/ship.rb'
require 'pry'
class Game
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)

  def welcome_message
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
  end

  def user_input
    input = gets.chomp
  end

  def play?
    if user_input == "p"
    else
      puts "Invalid input"
    end
  end

  def quit?
    if user_input == "q"
    else
      puts "Invalid input"
    end
  end

  def choice
    if play? == true
    elsif quit? == true
    end
  end

  def get_cpu_coords(ship)
    board = Board.new
    valid_coords = board.cells.keys
    cpu_coords = []
    coords = ship.length.times do
      cpu_coords << valid_coords.delete(valid_coords.sample)
    end
    if board.valid_placement?(ship, cpu_coords)
      return cpu_coords
    else
      return get_cpu_coords(ship)
    end
  end

  def cpu_placement(ship)
    board = Board.new
    board.place(ship, get_cpu_coords(ship))
  end

end
cruiser = Ship.new("Cruiser", 3)
game = Game.new
p game.get_cpu_coords(cruiser)
# game.play?
p game.cpu_placement(cruiser)
