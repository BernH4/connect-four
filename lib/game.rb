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
    @checker = WinChecker.new
    # print_board #debug
  end

  def check_horizontal
    @checker.reset
    @board.each do |line|
      line.each do |field|
        return field if @checker.winner?(field)
      end
    end
  return false
  end

  def check_vertical
    @checker.reset
    x = y = 0
    # binding.pry
    while x < @width
      while y < @height
        field = @board[y][x]
        return field if @checker.winner?(field)
        y += 1
      end
      y = 0
      x += 1
    end
  end

  def check_diagonal_up
    # binding.pry
    print_board
    # Direction: topleft -> bottomleft -> bottom right |__
    x = 0
    y = @height - 1
    loop do
      # puts "#{y} #{x}"
      winner = check_diagonals(y,x,"positive")
      return winner unless winner == nil
      y -= 1
      break if y == 0
    end
    y = 0
    while x < @width
      # puts "#{y} #{x}"
      winner = check_diagonals(y,x,"positive")
      return winner unless winner == nil
      x += 1
    end
  end

  def check_diagonals(y, x, slope)
    @checker.reset
    if slope == "positive"
      # binding.pry if y == 0 && x == 5
      until y == @height || x == @width 
        puts "Height:#{y} Width:#{x}\n~~~"
        field = @board[y][x]
        return field if @checker.winner?(field)
        y += 1; x += 1
      end
    else 
      until y == 0 || x == @width
        puts "Height:#{y}\n Width:#{x}\n~~~"
        field = @board[y][x]
        return field if @checker.winner?(field)
        y -= 1; x += 1
      end
    end
  end
end

Game.new("p1","p2")
