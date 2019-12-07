require "minitest/autorun"
require "minitest/pride"
require "./lib/board"
require "./lib/ship"
#require "./lib/cell"

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    # @cell_1 = Cell.new("B4")
    # @cell_2 = Cell.new("C3")
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

  def test_placement_is_length_of_ship
    skip
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_coordinate_letters_are_the_same
    assert_equal true, @board.same_letters?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.same_letters?(@cruiser, ["A1", "B2", "C4"])
    assert_equal false, @board.same_letters?(@cruiser, ["A1", "C1", "B1"])
    assert_equal false, @board.same_letters?(@cruiser, ["A1", "B1", "B1"])
  end

  def test_coordinate_numbers_are_consecutive
    assert_equal false, @board.consecutive_numbers?(@cruiser, ["A1", "A2", "A4"])
    assert_equal true, @board.consecutive_numbers?(@cruiser, ["A2", "A3", "A4"])
    assert_equal false, @board.consecutive_numbers?(@cruiser, ["A1", "B1", "C1"])
    assert_equal false, @board.consecutive_numbers?(@cruiser, ["A1", "B4", "C3"])
  end

  def test_coordinate_letters_are_consecutive
    assert_equal true, @board.consecutive_letters?(@cruiser, ["A1", "B2", "C4"])
    assert_equal false, @board.consecutive_letters?(@cruiser, ["A2", "A3", "A4"])
    assert_equal false, @board.consecutive_letters?(@cruiser, ["A1", "D1", "C1"])
    assert_equal true, @board.consecutive_letters?(@cruiser, ["D2", "C4", "B3"])
  end

  def test_coordinates_are_consecutive
    skip
    @board.consecutive_letters?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    #assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    #assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    #assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
  end
end
