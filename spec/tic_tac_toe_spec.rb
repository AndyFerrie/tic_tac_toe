require_relative("../tic_tac_toe.rb")
require 'stringio'

describe "Tic Tac Toe" do

    game = TicTacToe.new
    player_one = game.player_one
    player_two = game.player_two

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
        game.move(game.player_one, 1)
        expect(game.board).to eq(['X', '2', '3', '4', '5', '6', '7', '8', '9'])
    end

    it "updates cell when player one make a move" do
        game = TicTacToe.new
        game.move(game.player_one, 1)
        expect(game.board[0]).to eq('X')
    end

    it "updates board when player one and player two make moves" do
        game = TicTacToe.new
        game.move(player_one, 1)
        game.move(player_two, 3)
        expect(game.board).to eq(['X', '2', 'O', '4', '5', '6', '7', '8', '9'])
    end
    
    it "doesn't update board when player two selects the same cell as and player one" do
        game = TicTacToe.new
        game.move(game.player_one, 1)
        expect {game.move(player_two, 1)}.to output("Cell already taken\n").to_stdout
        expect(game.board).to eq(['X', '2', '3', '4', '5', '6', '7', '8', '9'])
    end

    it "announces winner when they have 3 cells in a horizontal row" do
        game = TicTacToe.new
        game.move(player_one, 1)
        game.move(player_two, 4)
        game.move(player_one, 2)
        game.move(player_two, 5)
        game.move(player_one, 3)
        expect {game.check_for_win}.to output("Player 1 wins!\n").to_stdout
    end
    
    it "annonces winner when they have 3 cells in a vertical row" do
        game = TicTacToe.new
        game.move(player_one, 2)
        game.move(player_two, 1)
        game.move(player_one, 5)
        game.move(player_two, 9)
        game.move(player_one, 8)
        expect {game.check_for_win}.to output("Player 1 wins!\n").to_stdout
    end

    it "announces winner when they have 3 cells in a diagonal row" do
        game = TicTacToe.new
        game.move(player_one, 1)
        game.move(player_two, 5)
        game.move(player_one, 9)
        game.move(player_two, 3)
        game.move(player_one, 4)
        game.move(player_two, 7)
        expect {game.check_for_win}.to output("Player 2 wins!\n").to_stdout
    end

    it "announces a draw when no one has won" do
        game = TicTacToe.new
        game.move(player_one, 1)
        game.move(player_two, 3)
        game.move(player_one, 2)
        game.move(player_two, 5)
        game.move(player_one, 6)
        game.move(player_two, 4)
        game.move(player_one, 9)
        game.move(player_two, 8)
        game.move(player_one, 7)
        expect {game.check_for_win}.to output("It's a draw!\n").to_stdout
    end

    it "announces a win on a 9 move game" do
        game = TicTacToe.new
        game.move(player_one, 3)
        game.move(player_two, 5)
        game.move(player_one, 9)
        game.move(player_two, 6)
        game.move(player_one, 4)
        game.move(player_two, 7)
        game.move(player_one, 1)
        game.move(player_two, 8)
        game.move(player_one, 2) 
        expect {game.check_for_win}.to output("Player 1 wins!\n").to_stdout
    end

    it "takes user input" do
        game = TicTacToe.new
        allow($stdin).to receive(:gets).and_return("1")
        input = $stdin.gets
        expect(input).to eq("1")
    end

    it "converts input to integer and returns valid input" do
        game = TicTacToe.new
        input = "5"
        expect(game.check_input(input)).to eq(5)
    end

    #it "returns an error for invalid inputs" do
        #allow($stdin).to receive(:gets).and_return("10")
        #$stdin = StringIO.new("11")
        # input = "11"
        # expect {game.check_input(input)}.to output(/Invalid input\n/).to_stdout
        # input = "-2"
        # expect {game.check_input(input)}.to output(/Invalid input\n/).to_stdout
        # input = "@"
        # expect {game.check_input(input)}.to output(/Invalid input\n/).to_stdout
        # input = "A"
        # expect {game.check_input(input)}.to output(/Invalid input\n/).to_stdout
        
    #end

    it "returns error 2.0" do
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
ask if you want to play again?
=end