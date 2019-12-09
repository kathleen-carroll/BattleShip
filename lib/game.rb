require './lib/ship'
require './lib/game'
require './lib/cell'

class Game

  def display_welcome_screen
    p "Welcome to BATTLESHIP.... GAMETIME!"
    p "Press (p)lay if you dare! \n read the (i)nstructions, or (q)uit?"
      input = gets.chomp.downcase
    until input == "p" || input == "q"
      if input == "p"
      game_start
      elsif input == "q"
      puts "Bye!"
      end
    end
  end

  def game_start
    p "I have laid out my ships on the grid."
    p "You now need to layout your two ships."
    p "The first is #{@ship.length} long and the second is #{@ship.length}."
    @board.render
    p "Enter the squares for the #{@ship}:"
    @coordinates = gets.chomp
  end












end
