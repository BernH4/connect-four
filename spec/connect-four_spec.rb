require './lib/game.rb'

describe Game do
  subject { Game.new("pname1","pname2") }
    describe "#default_board_arr" do
      it "returns a valid arr" do
        expect(subject.board).to be_a(Array)
      end
    end
    
    describe "#check_horizontal" do
      it "finds a winner" do
        subject.board[1][1] = "X"
        subject.board[1][2] = "X"
        subject.board[1][3] = "X"
        subject.board[1][4] = "X"
        subject.check_all
        expect(subject.winner).to eq("X")
      end
    end
    describe "#check_vertical" do
      it "finds a winner" do
        subject.board[1][0] = "X"
        subject.board[2][0] = "X"
        subject.board[3][0] = "X"
        subject.board[4][0] = "X"
        subject.check_all
        expect(subject.winner).to eq("X")
      end
    end

    describe "#check_diagonal_up" do
      it "finds a winner" do
        subject.board[0][0] = "X"
        subject.board[1][1] = "X"
        subject.board[2][2] = "X"
        subject.board[3][3] = "X"
        subject.check_all
        expect(subject.winner).to eq("X")
      end
    end

    describe "#check_diagonal_up" do
      it "finds a winner" do
        subject.board[0][5] = "X"
        subject.board[1][6] = "X"
        subject.board[2][7] = "X"
        subject.board[3][8] = "X"
        subject.check_all
        expect(subject.winner).to eq("X")
      end
    end

    describe "#check_diagonal_down" do
      it "finds a winner" do
        subject.board[3][0] = "X"
        subject.board[2][1] = "X"
        subject.board[1][2] = "X"
        subject.board[0][3] = "X"
        subject.check_all
        expect(subject.winner).to eq("X")
      end
    end
    describe "#check_diagonal_down" do
      it "finds a winner" do
        subject.board[5][5] = "X"
        subject.board[4][6] = "X"
        subject.board[3][7] = "X"
        subject.board[2][8] = "X"
        subject.check_all
        expect(subject.winner).to eq("X")
      end
    end
end




# describe Game do
#     # subject { Game.new }
#   describe "#check_somebody_won" do
#     it "Game ends when there is no space for new rounds" do
#       subject.board_arr = %w[Empty "0" "0" "0" "0" "0" "0" "0" "0" "0"]
#       expect(subject.check_somebody_won("0")).to eql(true)
#     end
#   end
# end
