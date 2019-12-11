require "minitest/autorun"
require "minitest/pride"
require "./lib/board"
require "./lib/ship"
require "./lib/cell"

@computer_board = Board.new
@player_board = Board.new
@cruiser = Ship.new("Cruiser", 3)
@submarine = Ship.new("Submarine", 2)
# require "pry"; binding.pry
#(@computer_board.cells.count ** (0.5)).to_i gives you 4
#rand(1.. ((@computer_board.cells.count ** (0.5)).to_i))

def computer_board
  ships = [@cruiser, @submarine]
  #num = 0
  numbers = ships.map do |ship|
    ship.length.times do
      rand(1.. ((@computer_board.cells.count ** (0.5)).to_i))
    end
  end
  #require "pry"; binding.pry
  cruiser_num1 = rand(1.. ((@computer_board.cells.count ** (0.5)).to_i))
  cruiser_num2 = rand(1.. ((@computer_board.cells.count ** (0.5)).to_i))
  cruiser_num3 = rand(1.. ((@computer_board.cells.count ** (0.5)).to_i))
  
  letters = "ABCD"
  r1 = rand(0..((@computer_board.cells.count ** (0.5)).to_i))
  r2 = rand(0..((@computer_board.cells.count ** (0.5)).to_i))
  r3 = rand(0..((@computer_board.cells.count ** (0.5)).to_i))
  cruiser_letter1 = letters[r1]
  cruiser_letter2 = letters[r2]
  cruiser_letter3 = letters[r3]
  coord1 = cruiser_num1.to_s + cruiser_letter1
  coord2 = cruiser_num2.to_s + cruiser_letter2
  coord3 = cruiser_num3.to_s + cruiser_letter3
  coordinates = [coord1, coord2, coord3]
  @computer_board.same_numbers?(@cruiser, coordinates)
  #@computer_board.validate_placement?(@cruiser, [coord1, coord2, coord3])
  require "pry"; binding.pry
  if @computer_board.valid_placement?(@cruiser, coordinates) == true
  @computer_board.place(@cruiser, coordinates)
  p @computer_board.render
  end
  #require "pry"; binding.pry
end

def game_start
 p "Now it's time to play"
end

#def welcome
p "Welcome to BATTLESHIP.... GAMETIME!"
p "Press (p)lay if you dare! read the (i)nstructions, or (q)uit?"
  input = gets.chomp.downcase
#   require "pry"; binding.pry
# until input == "p" || input == "q"
  if input == "p"
    game_start
  elsif input == "q"
    puts "Bye!"
  end
# end
#end

computer_board

# welcome
