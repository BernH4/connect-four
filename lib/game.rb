require 'pry'
require 'amazing_print'

require_relative 'display.rb'
require_relative 'winchecker.rb'
require_relative 'player.rb'

class Game
  attr_reader :board, :winner, :p1, :p2
  include Display
  def initialize
    # @p1 = Player.new(get_name(1), "X")
    # @p2 = Player.new(get_name(2), "O")
    @p1 = Player.new("Berni", "X")
    @p2 = Player.new("Gustl", "O")
    @board = gen_game_board(6, 9) # height, width
    @checker = WinChecker.new
    @winner = nil
    # print_board(@board) #debug
  end

  def get_name(nr)
    nr == 1 ? symbol = "X" : symbol = "O"
    puts "Player #{nr}, whats your name?"
    name = gets.chomp
    puts "Perfect, your symbol is '#{symbol}'\n"
    name
  end
  
  def check_all
    check_horizontal 
    check_vertical 
    check_diagonal_up 
    check_diagonal_down
  end

  def check_horizontal
    @checker.reset
    @board.each do |line|
      line.each do |field|
        @winner = field and return if @checker.winner?(field)
      end
    end
  end

  def check_vertical
    @checker.reset
    y = x = 0
    # binding.pry
    while x < @width
      while y < @height
        field = @board[y][x]
        @winner = field and return if @checker.winner?(field)
        y += 1
      end
      y = 0
      x += 1
    end
  end

  def check_diagonal_up
    # binding.pry
    # print_board(@board)
    # Direction: topleft -> bottomleft -> bottom right |__
    y = @height - 1
    x = 0
    loop do
      # puts "#{y} #{x}"
      check_diagonals(y,x,"positive")
      y -= 1
      break if y == 0
    end
    # y = 0
    loop do
      # puts "#{y} #{x}"
      check_diagonals(y,x,"positive")
      x += 1
      break if x == @width
    end
  end

  def check_diagonal_down
    # Direction: topright -> topleft -> downleft 
    y = @height -1
    x = @width -1
    loop do
      # puts "#{y} #{x}"
      check_diagonals(y,x,"negative")
      x -= 1
      break if x == 0
    end
    loop do
      # puts "#{y} #{x}"
      check_diagonals(y,x,"negative")
      y -= 1
      break if y < 0
    end
  end

  def check_diagonals(y, x, slope)
    # puts "#{y} #{x}"
    @checker.reset
    if slope == "positive"
      until y == @height || x == @width 
        # puts "pos: Height:#{y} Width:#{x}\n~~~"
        field = @board[y][x]
        (@winner = field and return) if @checker.winner?(field)
        y += 1; x += 1
      end
    elsif slope == "negative"
      until y < 0 || x == @width
        field = @board[y][x]
        @winner = field and return if @checker.winner?(field)
        y -= 1; x += 1
      end
    end
  end
end
