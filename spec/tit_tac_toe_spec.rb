require_relative("../tic_tac_toe.rb")

describe "Tic Tac Toe" do

    tictactoe = TicTacToe.new
    it "has 9 values in the array" do
        expect(tictactoe.placement_array.length).to eq(9)
    end

    it "creates player one and assigns X" do
        expect(tictactoe.player_one).to eq("X")
    end 

    it "creates player two and assigns O" do
        expect(tictactoe.player_two).to eq("O")
    end 

    it "print board outputs something" do
        expect { tictactoe.print_board }. to output.to_stdout   
    end

    it "prints the lines of the board" do
        expect { tictactoe.print_board }.to output(/---\|---\|---/).to_stdout
    end

    it "prints an empty board" do
        expect { tictactoe.print_board }.to output(/ 1 \| 2 \| 3 \n/).to_stdout
        expect { tictactoe.print_board }.to output(/ 4 \| 5 \| 6 \n/).to_stdout
        expect { tictactoe.print_board }.to output(/ 7 \| 8 \| 9 \n/).to_stdout
    end

    context "prints an empty board" do
        placement_array = ['X', 'X', 'X', '4', '5', '6', '7', '8', '9']
        specify { expect { print (tictactoe.print_board(placement_array)) }.to output(/ X \| X \| X /).to_stdout }
        # expect { tictactoe.print_board(placement_array) }.to output(/ 4 | 5 | 6 /).to_stdout
        # expect { tictactoe.print_board(placement_array) }.to output(/ 7 | 8 | 9 /).to_stdout
    end
        
end

      