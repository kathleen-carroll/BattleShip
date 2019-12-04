require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
<<<<<<< HEAD
require 'pry'

class ShipTest < Minitest::Test

=======

class ShipTest < Minitest::Test
>>>>>>> 9a034cad6ea1587b276122e5ca1462fd9ce15678
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_ship_attributes
    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
    assert_equal 3, @cruiser.health
    assert_equal false, @cruiser.sunk?
  end

  def test_hit_hurts_health
    @cruiser.hit
    assert_equal 2, @cruiser.health
    @cruiser.hit
    assert_equal 1, @cruiser.health
    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    assert_equal true, @cruiser.sunk?
  end

end
