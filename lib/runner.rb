require './lib/board.rb'
require './lib/ship.rb'
require './lib/game'
require './lib/cell.rb'

def start
  player_cruiser = Ship.new("Cruiser", 3)
  cpu_cruiser = Ship.new("Cruiser", 3)
  player_submarine = Ship.new("Submarine", 2)
  cpu_submarine = Ship.new("Submarine", 2)
  cpu_board = Board.new(cpu_cruiser, cpu_submarine)
  player_board = Board.new(player_cruiser, player_submarine)
  game = Game.new(cpu_board, player_board)
  # game.start

  game.welcome_message
  # game.set_up(player_board, cpu_board)
  # game.turn(player_board, cpu_board)
end

start()
