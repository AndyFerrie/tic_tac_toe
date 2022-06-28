class TicTacToe
    attr_accessor :board
    def initialize
        @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    end

    def assign_player_one
        player_one = "X"
    end

    def assign_player_two
        player_two = "O"
    end

    def print_board(board = @board)
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "---|---|---"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "---|---|---"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def move(player, cell)
        if board[cell - 1] == "X" or board[cell - 1] == "O"
            print "Cell already taken"
        else
            board[cell - 1] = player
        end
    end 

end



    

