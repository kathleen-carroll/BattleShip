require './lib/board'

class Game

  def initialize
    @player_board = Board.new
    @cpu_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
  end

  def welcome_screen
    p "Welcome to BATTLESHIP....GAMETIME!"
    p "Press (p)lay if you dare! or (q)uit?"
    selection_input = gets.chomp
    until selection_input == "p" || selection_input == "q" do
      if selection_input.downcase == "p"
        player_ship_place
      elsif selection_input.downcase == "q"
        p "Goodbye"
      else
        puts "Please enter p or q."
        selection_input = gets.chomp
      end
    end
  end

  def player_ship_place
    p "I have laid out my ships on the grid"
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render(true)
    p "Enter the coordinates for the cruiser: Use the format A1 A2 A3 (3 spaces)"
    loop do
      ship = @player_cruiser
      ship_placement = gets.chomp.upcase.gsub(" ", ",").split(",")
      until @player_board.valid_placement?(ship, ship_placement) == true
        puts "The coordinates you entered are invalid! Please try again."
        ship_placement = gets.chomp.upcase.gsub(" ", ",").split(",")
      end
        @player_board.place(@player_cruiser, ship_placement)
        puts @player_board.render(true)
        p "Now enter the coordinates for the submarine: Use the same format from above (2 spaces)"
        ship = @player_submarine
        ship_placement = gets.chomp.upcase.gsub(" ", ",").split(",")
        until @player_board.valid_placement?(ship, ship_placement) == true
          puts "The coordinates you entered are invalid! Please try again."
          ship_placement = gets.chomp.upcase.gsub(" ", ",").split(",")
        end
        @player_board.place(@player_submarine, ship_placement)
        puts @player_board.render(true)
      end
    end
  end
