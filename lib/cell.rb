class Cell
  attr_reader :coordinate, :fired_upon, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
  end

  def fired_upon?
    @fired_upon
  end

  def fired_upon
      @fired_upon = true
      ship.hit if ship != nil
  end

  def render(boolean = false)
    if boolean == true && ship != nil
      'S'
    elsif @fired_upon == false
      '.'
    elsif @fired_upon == true && ship == nil
      'M'
    elsif @fired_upon == true && ship != nil && ship.sunk? == false
      'H'
    elsif @fired_upon == true && ship != nil && ship.sunk? == true
      'X'
    end
  end
end
