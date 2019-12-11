require './lib/board'

class Game
  attr_reader :cpu_board, :player_board

  def initialize
    @cpu_board = Board.new
    @player_board = Board.new
  end

  def cpu_ship_place(ship, coordinates =[])
    until @cpu_board.valid_placement?(ship, coordinates) == true
        coordinates = @cpu_board.cells.keys.sample(ship.length)
    end
    @cpu_board.place(ship, coordinates)
  end

  def player_ship_place(ships)
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your #{ships.length} ships."
    puts "The #{ships[0].name} is #{ships[0].length} units long and the #{ships[-1].name} is #{ships[-1].length} units long."
    puts @player_board.render(true)
    puts "Enter the squares for the #{ships[0].name} (#{ships[0].length}):"
    coordinates = gets.chomp
    coordinates = coordinates.split

    until @player_board.valid_placement?(ships[0], coordinates)
      # require "pry"; binding.pry
      puts "Those are invalid coordinates. Please try again:"
      coordinates = gets.chomp
      coordinates = coordinates.split
    end
    @player_board.place(ships[0], coordinates)
    puts @player_board.render(true)

    puts "Enter the squares for the #{ships[-1].name} (#{ships[-1].length}):"
    coordinates = gets.chomp
    until @player_board.valid_placement?(ships[-1], coordinates.split) == true
      puts "Those are invalid coordinates. Please try again:"
      coordinates = gets.chomp
    end
    @player_board.place(ships[-1], coordinates.split)
    puts @player_board.render(true)
  end
end
