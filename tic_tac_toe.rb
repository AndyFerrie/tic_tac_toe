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

    def print_board(placement_array = @placement_array)
        puts " #{placement_array[0]} | #{placement_array[1]} | #{placement_array[2]} "
        puts "---|---|---"
        puts " #{placement_array[3]} | #{placement_array[4]} | #{placement_array[5]} "
        puts "---|---|---"
        puts " #{placement_array[6]} | #{placement_array[7]} | #{placement_array[8]} "
    end
end



    

