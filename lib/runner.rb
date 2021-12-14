require './lib/board.rb'
require './lib/ship.rb'
require './lib/game'
require './lib/cell.rb'

def start
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)
  cpu_board = Board.new
  player_board = Board.new
  game = Game.new(cpu_board, player_board, cruiser, submarine)


  cpu_board.render_b
  game.computer_shot
end

start()
