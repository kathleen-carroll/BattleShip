require './lib/ship'
require './lib/game'
require './lib/cell'

class Game

  # def initiliaze
  # # @player_board = Board.new
  # # @computer_board = Board.new
  # # @ships = {
  # #     cruiser: Ship.new("Cruiser", 3),
  # #     submarine: Ship.new("Submarine", 2)
  # end

  # def display_welcome_screen
  #   p "Welcome to BATTLESHIP.... GAMETIME!"
  #   game_start
  # end

  def game_start
    p "Press (p)lay if you dare! \n read the (i)nstructions, or (q)uit?"
    selection_input = gets.chomp
    until selection_input == "p" || selection_input == "q" do
      if selection_input.downcase == "p"
        setup #setup method below
      elsif selection_input.downcase == "q"
        abort "Goodbye"
      else
        puts "Please enter p or q."
        selection_input = gets.chomp
      end
    end
  end
end
