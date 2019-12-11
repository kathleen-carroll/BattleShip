require "minitest/autorun"
require "minitest/pride"
require "./lib/board"
require "./lib/ship"
require "./lib/user"
#require "./lib/cell"
require "./lib/game"
require "./lib/turn"

class TurnTest < Minitest::Test
  def setup
    @turn = Turn.new
    @game = Game.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ships = [@cruiser, @submarine]
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_current_board_info_shows_board
    skip
    @turn.current_board_info(@game.cpu_board, @game.player_board)

    @game.player_ship_place(@ships)
    @turn.current_board_info(@game.cpu_board, @game.player_board)
  end

  def test_player_shot_and_board_shows_shot
    skip
    @turn.player_shot(@game.cpu_board, @game.player_board)
    @turn.player_render(@game.cpu_board, @game.player_board)
  end

  def test_cpu_shot_and_board_shows_player_where_their_board_was_shot
    @game.player_ship_place(@ships)
    @turn.cpu_shot(@game.cpu_board, @game.player_board)
    @turn.cpu_render(@game.cpu_board, @game.player_board)
  end

end
