require "./lib/cell"

class Board
  attr_reader :cells

  def initialize
    @cells = cell_generator#{}
  end

  def cell_generator
      #require "pry"; binding.pry
    coordinate_letter = Array("A".."D")
    num = coordinate_letter.length
    numbers =[]
    num.times do
      numbers << num
      num -= 1
    end
    num_2 = coordinate_letter.length - 1
    coordinates = []
    coordinate_letter.each do |coordinate_letter|
      require "pry"; binding.pry
      coordinate = coordinate_letter + numbers[num_2].to_s
      coordinates << coordinate
      num_2 -= 1
    end
  end

  def cells
    #@num = 0
    coordinates = ["A1", "A2", "A3", "A4"]
    # require "pry"; binding.pry
    #cell.coordinate => cell
    coordinates.each do |coordinate|
      #require "pry"; binding.pry
      cell = Cell.new(coordinate) #coordinate[@num]
      #require "pry"; binding.pry
      #@num =+ 1
      @cells[cell.coordinate] = cell
    end
    #cell = Cell.New(coordinate[@num])
    #@cells[cell.coordinate] = cell
    #require "pry"; binding.pry
    @cells
  end
end
