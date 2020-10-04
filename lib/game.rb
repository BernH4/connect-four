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

  # def check_vertical
  #   vertical_checker = WinChecker.new
  #   binding.pry
  #   (1..@width).each do |row|
  #     @board.each do |line|
  #     return line[row] if vertical_checker.winner?(line[row])
  #     end
  #   end
  # return false
  # end

end
