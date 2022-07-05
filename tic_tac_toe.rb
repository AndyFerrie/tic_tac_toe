class TicTacToe
    attr_accessor :board, :winning_combinations, :move_count
    def initialize
        @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
        @move_count = 0
        @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    end

    def print_board(board = @board)
        puts "\n"
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "---|---|---"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "---|---|---"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
        puts "\n"
    end

    def move(cell, player)

        if board[cell - 1] == 'X' or board[cell - 1] == 'O'
            puts "Cell already taken\n"
        else
            board[cell - 1] = player
            @move_count = move_count + 1
        end
        
    end 

    def check_for_win
        winning_combinations.map do |combination|
            if board[combination[0]] == "X" and board[combination[1]] == "X" and board[combination[2]] == "X"
                puts "Player 1 wins!\n"
                return
            elsif board[combination[0]] == "O" and board[combination[1]] == "O" and board[combination[2]] == "O"
                puts "Player 2 wins!\n"
                return
            elsif move_count == 9
                puts "It's a draw!\n"
                return
            end
        end
        false
    end  

    def user_input

        if move_count.even? == true
            player = 'X'
        else
            player = 'O'
        end

        puts "#{player} enter your move\n"
        input = gets.chomp
        stringToInt = check_input(input)
        if  stringToInt == false
            puts "Invalid input. Please enter a number between 1 and 9\n"
            user_input
        else
            move(stringToInt, player)
        end
    end

    def check_input(input)
        input 
        if input.to_i.between?(1, 9)
            input.to_i
        else
            false
        end
    end

end

# game = TicTacToe.new
# game.print_board
# game.user_input
# game.print_board


    

