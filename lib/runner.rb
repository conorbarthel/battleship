require 'pry'
require './lib/board.rb'
require './lib/ship.rb'
require './lib/game'
require './lib/cell.rb'

def start
  p_cruiser = Ship.new("Cruiser", 3)
  c_cruiser = Ship.new("CCruiser", 3)
  p_submarine = Ship.new("Submarine", 2)
  c_submarine = Ship.new("SSubmarine", 2)
  comp_board = Board.new(cpu_cruiser, cpu_submarine)
  p_board = Board.new(player_cruiser, player_submarine)
  game = Game.new(cpu_board, player_board)
  # binding.pry
  # # game.start

  game.welcome_message
  # game.set_up(player_board, cpu_board)
  # game.turn(player_board, cpu_board)
end

start()
