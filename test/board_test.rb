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
    @cell1 = @board.cells["A1"]
    @cell2 = @board.cells["A2"]
    @cell3 = @board.cells["A3"]
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_board_has_cells
    assert_instance_of Hash, @board.cells
    assert_equal 16, @board.cells.count
    assert_instance_of Cell, @board.cells.values.first
  end

  def test_coordinates_are_on_board
    assert_equal true, @board.validate_coordinate?("A1")
    assert_equal true, @board.validate_coordinate?("D4")
    assert_equal false, @board.validate_coordinate?("A5")
    assert_equal false, @board.validate_coordinate?("E1")
    assert_equal false, @board.validate_coordinate?("A22")
  end

  def test_placement_is_length_of_ship
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_coordinate_numbers_are_the_same
    assert_equal true, @board.same_numbers?(@cruiser, ["C4", "B4", "A4"])
    assert_equal false, @board.same_numbers?(@cruiser, ["A2", "B2", "D4"])
    assert_equal false, @board.same_numbers?(@cruiser, ["A2", "C1", "B1"])
    assert_equal true, @board.same_numbers?(@cruiser, ["A1", "D1", "B1"])
    assert_equal false, @board.same_numbers?(@cruiser, ["A1", "D2", "B3"])
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

  def test_coordinates_are_consecutive_not_diagonal_and_valid
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    #assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    #assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_ships_can_be_placed_on_board
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_instance_of Cell, @cell1
    assert_instance_of Cell, @cell2
    assert_instance_of Cell, @cell3

    assert_instance_of Ship, @cell1.ship
    assert_instance_of Ship, @cell2.ship
    assert_instance_of Ship, @cell3.ship

    assert_equal true, @cell3.ship == @cell2.ship
  end

  def test_it_is_not_valid_if_ships_overlap_on_board
    @board.place(@cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    assert_equal false, @board.valid_placement?(submarine, ["A1", "B1"])
  end

  def test_board_render
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expected =  "  1 2 3 4 \n" +
                "A . . . . \n" +
                "B . . . . \n" +
                "C . . . . \n" +
                "D . . . . \n"
    new_expected = "  1 2 3 4 \n" +
                    "A S S S . \n" +
                    "B . . . . \n" +
                    "C . . . . \n" +
                    "D . . . . \n"
    assert_equal expected, @board.render
    assert_equal new_expected, @board.render(true)

    end

  end
