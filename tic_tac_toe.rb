class TicTacToe
    attr_accessor :board, :player_one, :player_two, :winning_combinations, :move_count
    def initialize
        @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
        @player_one = "X"
        @player_two = "O"
        @move_count = 0
        @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    end

    def print_board(board = @board)
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "---|---|---"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "---|---|---"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def move(player, cell)
        if board[cell - 1] == 'X' or board[cell - 1] == 'O'
            puts "Cell already taken"
        else
            board[cell - 1] = player
            @move_count = move_count + 1
        end
    end 

    def check_for_win
        winning_combinations.map do |combination|
            if board[combination[0]] == "X" and board[combination[1]] == "X" and board[combination[2]] == "X"
                puts "Player 1 wins!"
                return
            elsif board[combination[0]] == "O" and board[combination[1]] == "O" and board[combination[2]] == "O"
                puts "Player 2 wins!"
                return
            end
            
        end
        if move_count == 9
            puts "It's a draw!"
        end
    end  
end




    

