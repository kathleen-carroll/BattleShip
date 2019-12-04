class Ship
<<<<<<< HEAD

=======
>>>>>>> 9a034cad6ea1587b276122e5ca1462fd9ce15678
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    if health == 0
      true
    else false
    end
  end

  def hit
    @health -= 1
  end
<<<<<<< HEAD

=======
  
>>>>>>> 9a034cad6ea1587b276122e5ca1462fd9ce15678
end
