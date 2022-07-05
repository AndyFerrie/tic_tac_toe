require_relative("../tic_tac_toe.rb")
require 'stringio'

describe "Tic Tac Toe" do

    game = TicTacToe.new

    it "has 9 values in the array" do
        expect(game.board.length).to eq(9)
    end

    it "print board outputs something" do
        expect { game.print_board }. to output.to_stdout   
    end

    it "prints the lines of the board" do
        expect { game.print_board }.to output(/---\|---\|---/).to_stdout
    end

    it "prints an empty board with numbered cells" do
        expect { game.print_board }.to output(/ 1 \| 2 \| 3 \n/).to_stdout
        expect { game.print_board }.to output(/ 4 \| 5 \| 6 \n/).to_stdout
        expect { game.print_board }.to output(/ 7 \| 8 \| 9 \n/).to_stdout
    end

    context "prints a empty board with updated cell values" do
        board = ['X', 'X', 'X', '4', '5', '6', '7', '8', '9']
        specify { expect { game.print_board(board) }.to output(/ X \| X \| X /).to_stdout }
        specify { expect { game.print_board(board) }.to output(/ 4 \| 5 \| 6 /).to_stdout }
        specify { expect { game.print_board(board) }.to output(/ 7 \| 8 \| 9 /).to_stdout }
    end

    it "updates board when player one makes a move" do
        game.move(1, 'X')
        expect(game.board).to eq(['X', '2', '3', '4', '5', '6', '7', '8', '9'])
    end

    it "updates cell when player one make a move" do
        game = TicTacToe.new
        game.move(1, 'X')
        expect(game.board[0]).to eq('X')
    end

    it "updates board when player one and player two make moves" do
        game = TicTacToe.new
        game.move(1,'X')
        game.move(3, 'O')
        expect(game.board).to eq(['X', '2', 'O', '4', '5', '6', '7', '8', '9'])
    end
    
    it "doesn't update board when player two selects the same cell as and player one" do
        game = TicTacToe.new
        game.move(1, 'X')
        expect {game.move(1, 'X')}.to output("Cell already taken\n").to_stdout
        expect(game.board).to eq(['X', '2', '3', '4', '5', '6', '7', '8', '9'])
    end

    it "announces winner when they have 3 cells in a horizontal row" do
        game = TicTacToe.new
        game.move(1, 'X')
        game.move(4, 'O')
        game.move(2, 'X')
        game.move(5, 'O')
        game.move(3, 'X')
        expect {game.check_for_win}.to output("Player 1 wins!\n").to_stdout
    end
    
    it "annonces winner when they have 3 cells in a vertical row" do
        game = TicTacToe.new
        game.move(2, 'X')
        game.move(1, 'O')
        game.move(5, 'X')
        game.move(9, 'O')
        game.move(8, 'X')
        expect {game.check_for_win}.to output("Player 1 wins!\n").to_stdout
    end

    it "announces winner when they have 3 cells in a diagonal row" do
        game = TicTacToe.new
        game.move(1, "X")
        game.move(5, "O")
        game.move(9, "X")
        game.move(3, "O")
        game.move(4, "X")
        game.move(7, "O")
        expect {game.check_for_win}.to output("Player 2 wins!\n").to_stdout
    end

    it "announces a draw when no one has won" do
        game = TicTacToe.new
        game.move(1, "X")
        game.move(3, "O")
        game.move(2, "X")
        game.move(5, "O")
        game.move(6, "X")
        game.move(4, "O")
        game.move(9, "X")
        game.move(8, "O")
        game.move(7, "X")
        expect {game.check_for_win}.to output("It's a draw!\n").to_stdout
    end

    it "announces a win on a 9 move game" do
        game = TicTacToe.new
        game.move(3, "X")
        game.move(5, "O")
        game.move(9, "X")
        game.move(6, "O")
        game.move(4, "X")
        game.move(7, "O")
        game.move(1, "X")
        game.move(8, "O")
        game.move(2, "X") 
        expect {game.check_for_win}.to output("Player 1 wins!\n").to_stdout
    end

    it "returns false when no win or draw" do
        game = TicTacToe.new
        game.move(3, "X")
        game.move(5, "O")
        game.move(9, "X")
        game.move(6, "O")
        expect(game.check_for_win).to eq(false)
    end

    it "takes user input" do
        game = TicTacToe.new
        allow($stdin).to receive(:gets).and_return("1")
        input = $stdin.gets
        expect(input).to eq("1")
    end

    it "converts input to integer and returns valid input" do
        game = TicTacToe.new
        expect(game.check_input("5")).to eq(5)
    end

    it "returns false for invalid inputs" do
        expect(game.check_input(10)).to eq(false)
        expect(game.check_input(-9)).to eq(false)
        expect(game.check_input("A")).to eq(false)
        expect(game.check_input("@")).to eq(false)
        expect(game.check_input("12")).to eq(false)
        expect(game.check_input("-1")).to eq(false)
    end



end


=begin
start game
print board
print instructions
Ask for an input
check for valid input
convert input to integer
move
check for win
print board
ask for next input
announce win, lose, draw
=end