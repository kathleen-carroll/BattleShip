require "./lib/game"
require "./lib/turn"

@game = Game.new
@turn = Turn.new

@game.welcome_screen
#@game.player_ship_place
until @turn.player_win_game?(@game.cpu_board, @game.player_board) != nil || @turn.cpu_win_game?(@game.cpu_board, @game.player_board) != nil
@turn.current_board_info(@game.cpu_board, @game.player_board)
@turn.player_shot(@game.cpu_board, @game.player_board)
#@turn.player_render(@game.cpu_board, @game.player_board)
@turn.player_win_game?(@game.cpu_board, @game.player_board)
@turn.cpu_shot(@game.cpu_board, @game.player_board)
#@turn.cpu_render(@game.cpu_board, @game.player_board)
#@turn.player_render(@game.cpu_board, @game.player_board)
end
