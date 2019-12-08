require "./lib/cell"
require 'pry'

class Board
  attr_reader :cells

  def initialize
    @cells = cell_generator

    @consecutive_numbers = false
    @consecutive_letters = false
    @same_letters = false
    @same_numbers = false
    @open_cell = true
    #@render_val = ""
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

  def same_numbers?(ship, coordinates)
    numbers = coordinates.map do |coordinate|
      coordinate[-1] end.sort

    counter = []
    count = coordinates.length
    count.times do
      counter << count - 1
      count -= 1
      counter = counter.sort
    end

    counter.each do |count|
      next_val = count + 1
        return @same_numbers if next_val == coordinates.length
        return @same_numbers = false if numbers[count].to_i != numbers[next_val].to_i
        @same_numbers = true if numbers[count].to_i == numbers[next_val].to_i
    end

    @same_numbers
  end

  def consecutive_numbers?(ship, coordinates)
    numbers = coordinates.map do |coordinate|
      coordinate[-1] end.sort

      counter = []
      count = coordinates.length
      count.times do
        counter << count - 1
        count -= 1
        counter = counter.sort
      end

      counter.each do |count|
        next_val = count + 1
          return @consecutive_numbers if next_val == coordinates.length
          return @consecutive_numbers = false if numbers[count].to_i + 1 != numbers[next_val].to_i
          @consecutive_numbers = true if numbers[count].to_i + 1 == numbers[next_val].to_i
      end
      @consecutive_numbers
  end

  def same_letters?(ship, coordinates)
    letters = coordinates.map do |coordinate|
      coordinate[0] end.sort

    counter = []
    count = coordinates.length
    count.times do
      counter << count - 1
      count -= 1
      counter = counter.sort
    end

    counter.each do |count|
      next_val = count + 1
        return @same_letters if next_val == coordinates.length
        return @same_letters = false if letters[count] != letters[next_val]
        @same_letters = true if letters[count] == letters[next_val]
    end

    @same_letters
  end

  def consecutive_letters?(ship, coordinates)
    letters = coordinates.map do |coordinate|
      coordinate[0].ord end.sort

    counter = []
    count = coordinates.length
    count.times do
      counter << count - 1
      count -= 1
      counter = counter.sort
    end

    counter.each do |count|
      next_val = count + 1
        return @consecutive_letters if next_val == coordinates.length
        return @consecutive_letters = false if letters[count] + 1 != letters[next_val]
        @consecutive_letters = true if letters[count] + 1 == letters[next_val]
    end

    @consecutive_letters
  end

  def valid_placement?(ship, coordinates)
    if ship.length == coordinates.length && @open_cell == true
      if same_letters?(ship, coordinates) == true && consecutive_numbers?(ship, coordinates) == true
        true
      elsif same_numbers?(ship, coordinates) == true && consecutive_letters?(ship, coordinates) == true
        true
      else false
      end
    else false
    end
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      cell = cells[coordinate]
      cell.place_ship(ship)
      @open_cell = false #cell.empty? = false
    end
  end

  def render(boolean = false)
    if boolean == true
      "  1 2 3 4 \n" +
      "A " + cells["A1"].render(true) + " " + cells["A2"].render(true) + " " + cells["A3"].render(true) + " " + cells["A4"].render(true) +  " \n" +
      "B " + cells["B1"].render(true) + " " + cells["B2"].render(true) + " " + cells["B3"].render(true) + " " + cells["B4"].render(true) + " \n" +
      "C " +  cells["C1"].render(true) + " " + cells["C2"].render(true) + " " + cells["C3"].render(true) + " " + cells["C4"].render(true) + " \n" +
      "D " + cells["D1"].render(true) + " " +  cells["D2"].render(true) + " " + cells["D3"].render(true) + " " + cells["D4"].render(true) + " \n"
    else
      "  1 2 3 4 \n" +
      "A " + cells["A1"].render + " " + cells["A2"].render + " " + cells["A3"].render + " " + cells["A4"].render +  " \n" +
      "B " + cells["B1"].render + " " + cells["B2"].render + " " + cells["B3"].render + " " + cells["B4"].render + " \n" +
      "C " +  cells["C1"].render + " " + cells["C2"].render + " " + cells["C3"].render + " " + cells["C4"].render + " \n" +
      "D " + cells["D1"].render + " " +  cells["D2"].render + " " + cells["D3"].render + " " + cells["D4"].render + " \n"
    end
  end
end









  
