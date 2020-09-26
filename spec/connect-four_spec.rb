require './lib/game.rb'

describe Game do
  subject { Game.new("pname1","pname2") }
    describe "#default_board_arr" do
      it "returns a valid arr" do
        expect(subject.board).to be_a(Array)
      end
    end
    
    describe "
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
