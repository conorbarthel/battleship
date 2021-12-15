require 'pry'
require './lib/board.rb'
require './lib/ship.rb'
require './lib/game'
require './lib/cell.rb'

#Creates new game object and call the welcome message method
def start
  game = Game.new
  game.welcome_message
end

#Runs the start method
start
