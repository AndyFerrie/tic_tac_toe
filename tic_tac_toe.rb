class Player
    attr_accessor :name, :human, :marker
    def initialize(name, human, marker)
        
        @name = name
        @human = human
        @marker = marker
        
    end

end

class TicTacToe
    attr_accessor :board, :winning_combinations, :move_count, :available_cells, :player1, :player2
    def initialize
        @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
        @move_count = 0
        @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        @available_cells = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
        @player1 = player1
        @player2 = player2
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
            false
        else
            board[cell - 1] = player
            available_cells.delete(cell.to_s)
            @move_count = move_count + 1
        end
    end 

    def check_for_win
        winning_combinations.map do |combination|
            if board[combination[0]] == "X" and board[combination[1]] == "X" and board[combination[2]] == "X"
                print_board
                puts "Player 1 wins!\n"
                return
            elsif board[combination[0]] == "O" and board[combination[1]] == "O" and board[combination[2]] == "O"
                print_board
                puts "Player 2 wins!\n"
                return
            elsif move_count == 9
                print_board
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
        if input.to_i.between?(1, 9)
            input.to_i
        else
            false
        end
    end

    def choose_cell
        available_cells.sample
    end

end