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
    # binding.pry
    while x < @width
      while y < @height
        field = @board[y][x]
        return field if vertical_checker.winner?(field)
        y += 1
      end
      y = 0
      x += 1
    end
  end

  def check_diagonal_up
    print_board
    x = y = 0
    diagonal_up_checker = WinChecker.new
    while x < @width
      # puts "#{y} #{x}"
      field = @board[y][x]
      return field if diagonal_up_checker.winner?(field)
      x += 1
    end
    x = @width -1
    while y < @height
      # puts "#{y} #{x}"
      field = @board[y][x]
      y += 1
      # return field if diagonal_up_checker.winner?(field)
    end
  end

    def get_diagonal_fields(fx, fy, slope)
      init_x = fx
      init_y = fy
      curr_field = @board[init_y][init_x]
      fields = []
      until curr_field == nil || fx < 0
        puts "#{fx}#{fy}"
        # puts curr_field
        # fields << "curr_field #{fx}#{fy}"
        fields << curr_field 
        curr_field = @board[fy-=1][fx+=1]
      end
      fx = init_x
      fy = init_y
      curr_field = @board[init_y][init_x]
      puts "----"
      until curr_field == nil || fy < 0
        puts "#{fx}#{fy}"
        # fields << "curr_field #{fx}#{fy}" unless curr_field.equal?(@board[init_y][init_x])
        fields << curr_field unless curr_field.equal?(@board[init_y][init_x])
        curr_field = @board[fy+=1][fx-=1]
      end
      fields.sort
    end

  # def check_vertical
  #   x = y = 0
  #   vertical_checker = WinChecker.new
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

end

Game.new("p1","p2")
