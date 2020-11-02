# frozen_string_literal: true

require_relative 'game.rb'
# Params
board_height = 6
board_width = 9

game = Game.new(board_height, board_width)

max_rounds = board_height * board_width
roundnr = 0
# Start game loop
until roundnr == max_rounds
  game.p1.move(game.board); roundnr += 1
  break if game.check_all
  game.p2.move(game.board); roundnr += 1
  break if game.check_all
end
game.winner ? (puts "End, our winner is #{game.winner}!") : (puts 'Its a draw!')
