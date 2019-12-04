require "minitest/autorun"
require "minitest/pride"
require "./lib/board"
#require "./lib/ship"
#require "./lib/cell"

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    # @cell_1 = Cell.new("B4")
    # @cell_2 = Cell.new("C3")
    # @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_board_has_cells
    skip
    assert_instance_of Hash, @board.cells
  end
end
