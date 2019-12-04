
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser",3)
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
  end
