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
    assert_instance_of Board, @game.cpu_board
    assert_instance_of Board, @game.player_board
  end

  def test_game_creates_valid_cpu_board
    cpu = @game.cpu_ship_place(@cruiser)
    assert_equal 3, cpu.length
    cpu2 = @game.cpu_ship_place(@submarine)
    assert_equal 2, cpu2.length
    p @game.cpu_board.render(true)
  end
end
