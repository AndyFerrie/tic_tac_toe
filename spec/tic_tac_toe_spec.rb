require_relative("../tic_tac_toe.rb")

describe "Tic Tac Toe" do

    tictactoe = TicTacToe.new
    player_one = tictactoe.player_one
    player_two = tictactoe.player_two

    it "has 9 values in the array" do
        expect(tictactoe.board.length).to eq(9)
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
        tictactoe.move(tictactoe.player_one, 1)
        expect(tictactoe.board).to eq(['X', '2', '3', '4', '5', '6', '7', '8', '9'])
    end

    it "updates cell when player one make a move" do
        tictactoe = TicTacToe.new
        tictactoe.move(tictactoe.player_one, 1)
        expect(tictactoe.board[0]).to eq('X')
    end

    it "updates board when player one and player two make moves" do
        tictactoe = TicTacToe.new
        tictactoe.move(player_one, 1)
        tictactoe.move(player_two, 3)
        expect(tictactoe.board).to eq(['X', '2', 'O', '4', '5', '6', '7', '8', '9'])
    end
    
    it "doesn't update board when player two selects the same cell as and player one" do
        tictactoe = TicTacToe.new
        tictactoe.move(tictactoe.player_one, 1)
        expect {tictactoe.move(player_two, 1)}.to output("Cell already taken\n").to_stdout
        expect(tictactoe.board).to eq(['X', '2', '3', '4', '5', '6', '7', '8', '9'])
    end

    it "announces winner when they have 3 cells in a horizontal row" do
        tictactoe = TicTacToe.new
        tictactoe.move(player_one, 1)
        tictactoe.move(player_two, 4)
        tictactoe.move(player_one, 2)
        tictactoe.move(player_two, 5)
        tictactoe.move(player_one, 3)
        expect {tictactoe.check_for_win}.to output("Player 1 wins!\n").to_stdout
    end
    
    it "annonces winner when they have 3 cells in a vertical row" do
        tictactoe = TicTacToe.new
        tictactoe.move(player_one, 2)
        tictactoe.move(player_two, 1)
        tictactoe.move(player_one, 5)
        tictactoe.move(player_two, 9)
        tictactoe.move(player_one, 8)
        expect {tictactoe.check_for_win}.to output("Player 1 wins!\n").to_stdout
    end

    it "announces winner when they have 3 cells in a diagonal row" do
        tictactoe = TicTacToe.new
        tictactoe.move(player_one, 1)
        tictactoe.move(player_two, 5)
        tictactoe.move(player_one, 9)
        tictactoe.move(player_two, 3)
        tictactoe.move(player_one, 4)
        tictactoe.move(player_two, 7)
        expect {tictactoe.check_for_win}.to output("Player 2 wins!\n").to_stdout
    end

end

      