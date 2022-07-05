require_relative "./tic_tac_toe"

puts "
 _______ _        _______           _______                
|__   __(_)      |__   __|         |__   __|          
   | |   _  ___     | | __ _  ___     | | ___   ___ 
   | |  | |/ __|    | |/ _` |/ __|    | |/ _ \\ / _ \\
   | |  | | (__     | | (_| | (__     | | (_) |  __/
   |_|  |_|\\___|    |_|\\__,_|\\___|    |_|\\___/ \\___|
                                                    
Game instructions:\n
The first player is assigned 'X' while the second player is assigned 'O'.\n
To choose a square on the board, enter the corresponding number from 1 to 9\nand hit return!\n
Press enter to continue"
gets.chomp

game = TicTacToe.new
game.print_board

while game.check_for_win == false do
    game.user_input
    game.print_board
end