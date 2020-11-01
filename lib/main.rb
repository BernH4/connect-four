require_relative 'game.rb'

game = Game.new
# Start game loop
# TODO: out of fields
until @winner
  game.p1.move(game.board)
  game.p2.move(game.board)
  game.check_all
end
puts "Our winner is #{Game.winner}!"


