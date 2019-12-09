require './lib/ship'
require './lib/game'
require './lib/cell'

class Game

  def initiliaze
  @board = Board.new
  end 

  def display_welcome_screen
    p "Welcome to BATTLESHIP.... GAMETIME!"
    p "Press (p)lay if you dare! \n read the (i)nstructions, or (q)uit?"
      input = gets.chomp.downcase
      if input == "p"
      game_start
      elsif input == "q"
      puts "Bye!"

    end
  end

  def game_start
    p "I have laid out my ships on the grid."
    p "You now need to layout your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    @board
    p "Enter the squares for the cruiser:"
    @coordinates = gets.chomp
  end
end
