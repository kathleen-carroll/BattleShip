require './lib/board'

class Game
  attr_reader :computer_board, :player_board

  def initialize
    @cpu_board = Board.new
    @player_board = Board.new
  end

  def cpu_ship_place(ship, coordinates =[])
    #require "pry"; binding.pry
    until @cpu_board.valid_placement?(ship, coordinates) == true
        coordinates = @cpu_board.cells.keys.sample(ship.length)
    end

    @cpu_board.place(ship, coordinates)

      # until coordinates.uniq.length == ship.length
      #   coordinates << @computer_board.cells.keys.sample
      # end
      #
      # coordinates.uniq
      #
      # return coordinates.uniq if @computer_board.valid_placement?(ship, coordinates) == true
      # until @computer_board.valid_placement?(ship, coordinates) == true do
      #   require "pry"; binding.pry
      #   coordinates = []
      #   ship.length.times do
      #     coordinates << @computer_board.cells.keys.sample
      #   end
      #   coordinates
      # end

    #end
    #require "pry"; binding.pry
  end

  def vertical_random_3
    #all have the same number and different letters
    max = (@computer_board.cells.count ** (0.5)).to_i
    num = rand(1.. max)
    while num == nil
      num = rand(1.. max)
    end
    letters = "ABCD"
    r1 = rand(1..3)
    while r1 == nil
      r1 = rand(1..3)
    end
    letter1 = letters[r1]
    if letter1 == "A"
      letter2 = "B"
      letter3 = "C"
    elsif letter1 == "B"
      letter2 = "C"
      letter3 == "D"
    elsif letter1 == "C"
      letter2 == "A"
      letter3 == "B"
    elsif letter1 == "D"
      letter2 = "B"
      letter3 = "C"
    end
    letter2
    letter3
    coord1 = num.to_s + letter1
    coord2 = num.to_s + letter2
    coord3 = num.to_s + letter3
    coordinates = [coord1, coord2, coord3].sort
    coordinates
  end

  def vertical_random_2
    max = (@computer_board.cells.count ** (0.5)).to_i
    #all have the same number and different letters
    num = rand(1..max)
    letters = "ABCD"
    r1 = rand(1..max)
    letter1 = letters[r1]
    if letter1 == "A"
      letter2 = "B"
    elsif letter1 == "B"
      letter2 = "C"
    elsif letter1 == "C"
      letter2 == "B"
    elsif letter1 == "D"
      letter2 = "C"
    end
    letter2
    coord1 = num.to_s + letter1
    require "pry"; binding.pry
    coord2 = num.to_s + letter2
    require "pry"; binding.pry
    coordinates = [coord1, coord2].sort
    coordinates
  end

  def horizontal_random_3
    #all have the same letter and different numbers
    letters = "ABCD"
    r1 = rand(1..((@computer_board.cells.count ** (0.5)).to_i))
    letter = letters[r1]
    num1 = rand(1.. ((@computer_board.cells.count ** (0.5)).to_i))
    if num1 == 1
      num2 = 2
      num3 = 3
    elsif num1 == 2
      num2 = 3
      num3 == 4
    elsif num1 == 3
      num2 == 1
      num3 == 2
    elsif num1 == 4
      num2 = 2
      num3 = 3
    end
    num2
    num3
    coord1 = letter + num1.to_s
    coord2 = letter + num2.to_s
    coord3 = letter + num3.to_s
    coordinates = [coord1, coord2, coord3].sort
    coordinates
    require "pry"; binding.pry
  end

  def computer_board_generator
    # ships = [@cruiser, @submarine]
    # #num = 0
    # numbers = ships.map do |ship|
    #   ship.length.times do
    #     rand(1.. ((@computer_board.cells.count ** (0.5)).to_i))
    #   end
    # end
    #require "pry"; binding.pry
    cruiser_num1 = rand(1.. ((@computer_board.cells.count ** (0.5)).to_i))
    cruiser_num2 = rand(1.. ((@computer_board.cells.count ** (0.5)).to_i))
    cruiser_num3 = rand(1.. ((@computer_board.cells.count ** (0.5)).to_i))
    numbers = [cruiser_num1, cruiser_num1, cruiser_num1]
    #require "pry"; binding.pry
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
    require "pry"; binding.pry
    @computer_board.same_numbers?(@cruiser, coordinates)
    #@computer_board.validate_placement?(@cruiser, [coord1, coord2, coord3])
    require "pry"; binding.pry
    if @computer_board.valid_placement?(@cruiser, coordinates) == true
    @computer_board.place(@cruiser, coordinates)
    p @computer_board.render
    end
  end
end
