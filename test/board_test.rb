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
    assert_instance_of Hash, @board.cells
  end

  def test_coordinates_are_on_board
    assert_equal true, @board.validate_coordinate?("A1")
    assert_equal true, @board.validate_coordinate?("D4")
    assert_equal false, @board.validate_coordinate?("A5")
    assert_equal false, @board.validate_coordinate?("E1")
    assert_equal false, @board.validate_coordinate?("A22")
  end
end
