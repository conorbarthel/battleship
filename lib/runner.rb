require 'pry'
require './lib/board.rb'
require './lib/ship.rb'
require './lib/game'
require './lib/cell.rb'

def start
  game = Game.new()
  game.welcome_message
end

start()
