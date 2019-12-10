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
end
