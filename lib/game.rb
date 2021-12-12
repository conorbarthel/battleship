class Game

  def welcome
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



end

game = Game.new
#
game.play?
