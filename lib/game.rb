require 'pry'
require 'amazing_print'

require_relative 'display.rb'
require_relative 'winchecker.rb'

class Game
  attr_reader :board
  include Display
  def initialize(p1, p2)  
    @p1 = p1
    @p2 = p2
    @board = gen_game_board(6, 9) # height, width
    # binding.pry
    # print_board #debug
    # check_horizontal
  end

  def check_horizontal
    horizontal_checker = WinChecker.new
    @board.each do |line|
      line[1].each do |field|
        return field if horizontal_checker.winner?(field)
      end
    end
    return false
  end

  # def winner?(field, current_player, counter)
  #   current_player = field
  #   if field == current_player 
  #     counter += 1
  #   else
  #     counter = 0
  #     current_player = field
  #   end
  # end
end




Game.new("a","b")
