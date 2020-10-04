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
    binding.pry
    # print_board
    # print_board #debug
    # check_horizontal
  end

  def check_horizontal
    horizontal_checker = WinChecker.new
    @board.each do |line|
      line.each do |field|
        return field if horizontal_checker.winner?(field)
      end
    end
  return false
  end

  def check_vertical
    x = y = 0
    vertical_checker = WinChecker.new
    while x < @width
      while y < @height
        field = @board[x][y]
        return field if vertical_checker.winner?(field)
        x += 1
      end
      x = 0
      y += 1
    end
  end

  # def check_vertical
  #   x = y = 0
  #   vertical_checker = WinChecker.new
  #   while x < @width
  #     while y < @height
  #       field = @board[x][y]
  #       return field if vertical_checker.winner?(field)
  #       x += 1
  #     end
  #     x = 0
  #     y += 1
  #   end
  # end

end

Game.new("p1","p2")
