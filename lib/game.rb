require './lib/board'

class Game


  def initialize
    @player_board = Board.new
    @cpu_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
  end

  def display_welcome_screen
    p "Welcome to BATTLESHIP....GAMETIME!"
    p "Press (p)lay if you dare! or (q)uit?"
    selection_input = gets.chomp
    until selection_input == "p" || selection_input == "q" do
      if selection_input.downcase == "p"
        #game_setup
      elsif selection_input.downcase == "q"
        p "Goodbye"
      else
        puts "Please enter p or q."
        selection_input = gets.chomp
      end
    end
  end
end
