require "./lib/cell"

class Board
  attr_reader :cells

  def initialize
    @cells = cell_generator
    @consecutive_letters = false
  end

  def cell_generator
    cells = {}
    coordinate_letters = Array("A".."D")
    num = coordinate_letters.length
    numbers =[]
    num.times do
      numbers << num
      num -= 1
    end
    coordinates = []
    coordinate_letters.each do |coordinate_letter|
      numbers.sort.each do |number|
        coordinate = coordinate_letter + number.to_s
        coordinates << coordinate
      end

      coordinates
    end

    coordinates.each do |coordinate|
      cells[coordinate] = Cell.new(coordinate)
    end

    cells
  end

  def validate_coordinate?(coordinate)
    if cells[coordinate] == nil
      false
    else true
    end
  end

  def consecutive_letters?(ship, coordinates)
    letters = coordinates.map do |coordinate|
      coordinate[0] end

    counter = []
    count = coordinates.length #- 1
    count.times do
      counter << count - 1
      count -= 1
      counter = counter.sort
    end

    counter.each do |count|
      next_val = count + 1
      while next_val != coordinates.length
      #return if next_val == coordinates.length
        @consecutive_letters = true if letters[count] == letters[next_val]
          #require "pry"; binding.pry
          #@consecutive_letters = true
        #else @consecutive_letters = false
        #end
      #@consecutive_letters
      end
    end
    @consecutive_letters
  end

  # def valid_placement?(ship, coordinates)
  #   if ship.length == coordinates.length
  #     letters = []
  #     numbers = []
  #     coordinates.each do |coordinate|
  #       letters << coordinate[0]
  #       numbers << coordinate[-1]
  #     end
  #     letters
  #     numbers
  #     counter = []
  #     count = coordinates.length #- 1
  #     count.times do
  #       counter << count - 1
  #       count -= 1
  #       counter = counter.sort
  #     end
  #     counter.each do |order_no|
  #         #require "pry"; binding.pry
  #       if letters[order_no] == letters[order_no - 1] && numbers[order_no].to_f - 1 == numbers[order_no - 1].to_f
  #         boolean = true #letters match and numbers are 1 off
  #       elsif letters[order_no] != letters[order_no - 1] && numbers[order_no] == numbers[order_no - 1]
  #         boolean = true
  #       else boolean = false
  #       end
  #     end
  #     #if letters[counter] == letters[counter]
  #   else false
  #   end
  # end

end
