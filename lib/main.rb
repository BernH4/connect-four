require_relative 'game.rb'
        (@winner = field and return) if @checker.winner?(field)

Game.new("p1","p2")

# Start game loop
# TODO: out of fields
until @winner
  p1.move
  p2.move
  Game.check_all
end
puts "Our winner is #{Game.winner}!"
