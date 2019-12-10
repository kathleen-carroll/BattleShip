require "minitest/autorun"
require "minitest/pride"
require "./lib/board"
require "./lib/ship"
require "./lib/user"
#require "./lib/cell"

class UserTest < Minitest::Test
  def setup
  @computer = User.new
  @player = User.new
  end

  def test_it_exists
    assert_instance_of User, @computer
    assert_instance_of User, @player
  end

  def test_user_has_board
    assert_nil @computer.computer_board
    assert_nil @computer.player_board
    assert_nil @player.computer_board
    assert_nil @player.player_board
  end
end
