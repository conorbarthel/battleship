require './lib/board.rb'
require './lib/ship.rb'
require './lib/game'
require './lib/cell.rb'

def start
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)
  board = Board.new
  game = Game.new(board, [cruiser, submarine])

  board.render_b
  game.computer_shot
end

start()
