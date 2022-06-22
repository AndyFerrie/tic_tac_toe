require_relative("../tic_tac_toe.rb")

describe "Tic Tac Toe" do
    tictactoe = TicTacToe.new
    it "has 3 values in the array" do
        expect(tictactoe.placement_array.length).to eq(3)
    end

    it "has a total of 9 values in 2d array" do
        expect(tictactoe.placement_array.flatten.length).to eq(9)
    end
end