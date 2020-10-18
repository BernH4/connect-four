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
    @tc = 0 
    # print_board
    # print_board #debug
    # check_horizontal
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
      # field = @board[y][x]
      winner = check_diagonals(y,x,"positive")
      return winner unless winner == nil
      y -= 1
      break if y == 0
    end
    y = 0
    while x < @width
      # puts "#{y} #{x}"
      # field = @board[y][x]
      winner = check_diagonals(y,x,"positive")
      return winner unless winner == nil
      x += 1
    end
  end

  def check_diagonals(y, x, slope)
    #TODO: This code doesnt yet work when the winner has a row at the end of field
    @checker.reset
    field = @board[y][x]
    if slope == "positive"
      binding.pry if y == 0 && x == 5
      until y == @height - 1 || x == @width - 1 
         puts "Height:#{y} Width:#{x}\n~~~"
        return field if @checker.winner?(field)
        # return field if @checker.winner?(field)
        field = @board[y+=1][x+=1]
      end
    else 
      until y == 0 || x == @width
         puts "Height:#{y}\n Width:#{x}\n~~~"
        # return field if @checker.winner?(field)
        return field if @checker.winner?(field)
        field = @board[y+=1][x+=1]
      end
    end
  end
end

    # def get_diagonal_fields(fx, fy, slope)
    #   init_x = fx
    #   init_y = fy
    #   curr_field = @board[init_y][init_x]
    #   fields = []
    #   until curr_field == nil || fx < 0
    #     puts "#{fx}#{fy}"
    #     # puts curr_field
    #     # fields << "curr_field #{fx}#{fy}"
    #     fields << curr_field 
    #     curr_field = @board[fy-=1][fx+=1]
    #   end
    #   fx = init_x
    #   fy = init_y
    #   curr_field = @board[init_y][init_x]
    #   puts "----"
    #   until curr_field == nil || fy < 0
    #     puts "#{fx}#{fy}"
    #     # fields << "curr_field #{fx}#{fy}" unless curr_field.equal?(@board[init_y][init_x])
    #     fields << curr_field unless curr_field.equal?(@board[init_y][init_x])
    #     curr_field = @board[fy+=1][fx-=1]
    #   end
    #   fields.sort
    # end

  # def check_vertical
  #   x = y = 0
  #   while x < @width
  #     while y < @height
  #       field = @board[y][x]
  #       return field if vertical_checker.winner?(field)
  #       x += 1
  #     end
  #     x = 0
  #     y += 1
  #   end
  # end


Game.new("p1","p2")
