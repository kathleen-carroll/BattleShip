require "minitest/autorun"
require "minitest/pride"
require "./lib/board"
require "./lib/ship"
require "./lib/user"
#require "./lib/cell"
require "./lib/game"

class GameTest < Minitest::Test
  def setup
  @game = Game.new
  @cruiser = Ship.new("Cruiser", 3)
  @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_game_has_boards
    assert_instance_of Board, @game.computer_board
    assert_instance_of Board, @game.player_board
  end

  def test_game_creates_valid_computer_board
    @game.board_generator(@cruiser)
    #@game.vertical_random_3
    #@game.vertical_random_2
    #@game.horizontal_random_3
    #@game.computer_board_generator
    # assert_equal true, @computer_board.valid_placement?(@cruiser, )
  end
end
