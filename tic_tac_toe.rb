class TicTacToe
    attr_accessor :board, :player_one, :player_two, :winning_combinations
    def initialize
        @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
        @player_one = "X"
        @player_two = "O"
        @winning_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [3, 5, 7], [1, 5, 9]]
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
        end
    end 

    def check_for_win
        if board[0] == 'X' and board[1] == 'X' and board[2] == 'X'
        puts "Player 1 wins!"
        end
    end

        
    def winning_combinations.map do |combination| 
        count = 0
        combination.map do |cell|
            if player_one_moves.include?(cell)
                count++
            if count == 3
                puts "player one wins!"
            end
        end
    end
        
end




    

