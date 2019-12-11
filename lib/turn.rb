class Turn
  attr_reader :turn

  def initialize
    @turn = turn
  end

  def current_board_info(cpu_board, player_board)
    p "=============COMPUTER BOARD============="
    puts cpu_board.render
    p "==============PLAYER BOARD=============="
    puts player_board.render(true)
  end

  def player_shot(cpu_board, player_board)
    p "Enter the coordinate for your shot:"
    coordinate_shot = gets.chomp
    until cpu_board.validate_coordinate?(coordinate_shot) == true #cpu_board.cells.include?(coordinate_shot) == true
      p "Please enter a valid coordinate:"
      coordinate_shot = gets.chomp
    end
    cpu_board.cells[coordinate_shot].fired_upon

    if cpu_board.cells[coordinate_shot].render == "M"
      puts "You missed! No ship on #{coordinate_shot}"
    elsif cpu_board.cells[coordinate_shot].render == "H"
      puts "Hit!! Ship on #{coordinate_shot}"
    elsif cpu_board.cells[coordinate_shot].render == "X"
      puts "BOOM! You sunk the #{cpu_board.cells[coordinate_shot].ship.name}"
    end
  end

  def player_win_game?(cpu_board, player_board)
    #iterate over all cells of cpu board and find where ship != nil
    #iterate over the array of all cells that have ships and
    #see if ships are sunk, if they are exit the game
  end

  def player_render(cpu_board, player_board)
    p "=============COMPUTER BOARD============="
    puts cpu_board.render
    p "==============PLAYER BOARD=============="
    puts player_board.render(true)
  end

  def cpu_shot(cpu_board, player_board)
    coordinate_shot = ""
    until coordinate_shot != "" && player_board.validate_coordinate?(coordinate_shot) == true && player_board.cells[coordinate_shot].fired_upon? == false #coordinate is not fired_upon? #player_board.cells.include?(coordinate_shot) == true
      coordinate_shot = player_board.cells.keys.sample#(1)
    end
    player_board.cells[coordinate_shot].fired_upon

    if player_board.cells[coordinate_shot].render == "M"
      puts "CPU missed! No ship on #{coordinate_shot}"
    elsif player_board.cells[coordinate_shot].render == "H"
      puts "Hit!! CPU got your ship on #{coordinate_shot}"
    elsif player_board.cells[coordinate_shot].render == "X"
      puts "BOOM! CPU sunk your #{player_board.cells[coordinate_shot].ship.name}"
    end
  end

  def cpu_render(cpu_board, player_board)
    p "=============COMPUTER BOARD============="
    puts cpu_board.render
    p "==============PLAYER BOARD=============="
    puts player_board.render(true)
  end



  #exit game turn is over once one player sinks all the ships
  #in ship class there is a sunk flag

  #start game by showing player ship render true and computer board render false

  #have player take a shot and put in coordinate - record shot
  #check if game is won and all ships are sunk?

  #have computer take shot and record shot
  #check if game is won and all ships are sunk?
end
