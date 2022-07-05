require_relative "./tic_tac_toe"

puts "Game instructions: press enter to continue"
gets.chomp

game = TicTacToe.new
game.print_board

while game.check_for_win == false do
    while game.user_input != false && game.move_count != 9 do
    game.print_board
    end
end