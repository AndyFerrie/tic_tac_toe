require_relative "./tic_tac_toe"

game = TicTacToe.new
game.print_board

while game.check_for_win == false do
game.user_input
game.print_board
end