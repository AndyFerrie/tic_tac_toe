require_relative("../tic_tac_toe.rb")

describe "Tic Tac Toe" do

    tictactoe = TicTacToe.new
    it "has 9 values in the array" do
        expect(tictactoe.board.length).to eq(9)
    end

    it "creates player one and assigns X" do
        expect(tictactoe.assign_player_one).to eq("X")
    end 

    it "creates player two and assigns O" do
        expect(tictactoe.assign_player_two).to eq("O")
    end 

    it "print board outputs something" do
        expect { tictactoe.print_board }. to output.to_stdout   
    end

    it "prints the lines of the board" do
        expect { tictactoe.print_board }.to output(/---\|---\|---/).to_stdout
    end

    it "prints an empty board with numbered cells" do
        expect { tictactoe.print_board }.to output(/ 1 \| 2 \| 3 \n/).to_stdout
        expect { tictactoe.print_board }.to output(/ 4 \| 5 \| 6 \n/).to_stdout
        expect { tictactoe.print_board }.to output(/ 7 \| 8 \| 9 \n/).to_stdout
    end

    context "prints a empty board with updated cell values" do
        board = ['X', 'X', 'X', '4', '5', '6', '7', '8', '9']
        specify { expect { tictactoe.print_board(board) }.to output(/ X \| X \| X /).to_stdout }
        specify { expect { tictactoe.print_board(board) }.to output(/ 4 \| 5 \| 6 /).to_stdout }
        specify { expect { tictactoe.print_board(board) }.to output(/ 7 \| 8 \| 9 /).to_stdout }
    end

    it "updates board when player one makes a move" do
        player_one = tictactoe.assign_player_one
        tictactoe.move(player_one, 1)
        expect(tictactoe.board).to eq(['X', '2', '3', '4', '5', '6', '7', '8', '9'])
    end

    it "updates cell when player one make a move" do
        tictactoe = TicTacToe.new
        player_one = tictactoe.assign_player_one
        tictactoe.move(player_one, 1)
        expect(tictactoe.board[0]).to eq('X')
    end

    it "updates board when player one and player two make moves" do
        tictactoe = TicTacToe.new
        player_one = tictactoe.assign_player_one
        player_two = tictactoe.assign_player_two
        tictactoe.move(player_one, 1)
        tictactoe.move(player_two, 3)
        expect(tictactoe.board).to eq(['X', '2', 'O', '4', '5', '6', '7', '8', '9'])
    end
    
    it "doesn't update board when player two selects the same cell as and player one" do
        tictactoe = TicTacToe.new
        player_one = tictactoe.assign_player_one
        player_two = tictactoe.assign_player_two
        tictactoe.move(player_one, 1)
        tictactoe.move(player_two, 1)
        expect(tictactoe.board).to eq(['X', '2', '3', '4', '5', '6', '7', '8', '9'])
    end
end

      