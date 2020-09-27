require 'pry'
require 'amazing_print'

require_relative 'display.rb'
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

  # def check_horizontal
  #   counter = 0
  #   current_player = ""
  #   binding.pry
  #   @board.each do |line|
  #     line.each do |field|
  #       field == current_player ? counter += 1 : current_player = field
  #       return current_player if counter == 4
  #     end
  #   end
  # end
end



Game.new("a","b")
