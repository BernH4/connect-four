require './lib/game.rb'

describe Game do
  subject { Game.new("pname1","pname2") }
    describe "#default_board_arr" do
      it "returns a valid arr" do
        expect(subject.board).to be_a(Hash)
      end
    end
    
    describe "#check_horizontal" do
      it "finds a winner" do
        subject.board[:line1][1] = "X"
        subject.board[:line1][2] = "X"
        subject.board[:line1][3] = "X"
        subject.board[:line1][4] = "X"
        expect(subject.check_horizontal).to eq("X")
      end
    end
    describe "#check_vertical" do
      it "finds a winner" do
        subject.board[:line1][0] = "X"
        subject.board[:line2][0] = "X"
        subject.board[:line3][0] = "X"
        subject.board[:line4][0] = "X"
        expect(subject.check_vertical).to eq("X")
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
