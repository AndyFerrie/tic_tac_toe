class TicTacToe
    attr_accessor :placement_array
    def initialize
        @placement_array = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    end

    def player_one
        player_one = "X"
    end

    def player_two
        player_two = "O"
    end

    def print_board
        puts " 1 | 2 | 3 "
        puts "---|---|---"
        puts " 4 | 5 | 6 "
        puts "---|---|---"
        puts " 7 | 8 | 9 "
    end
end



    

