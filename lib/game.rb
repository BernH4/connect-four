# frozen_string_literal: true

require 'pry'
require 'amazing_print'

require_relative 'display.rb'
require_relative 'winchecker.rb'
require_relative 'player.rb'

class Game
  attr_reader :board, :winner, :p1, :p2
  include Display
  def initialize(height = 6, width = 9)
    # @p1 = Player.new(get_name(1), 'X')
    # @p2 = Player.new(get_name(2), 'O')
    @p1 = Player.new("Player 1", 'X')
    @p2 = Player.new("Player 2", 'O')
    @board = gen_game_board(height, width)
    @checker = WinChecker.new
    @winner = nil
  end

  def get_name(nr)
    symbol = nr == 1 ? 'X' : 'O'
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
    @winner
  end

  def check_horizontal
    @checker.reset
    @board.each do |line|
      line.each do |field|
        @winner = field and break if @checker.winner?(field)
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
    # Direction: topleft -> bottomleft -> bottom right |__
    y = @height - 1
    x = 0
    loop do
      check_diagonals(y, x, 'positive')
      y -= 1
      break if y.zero?
    end
    loop do
      check_diagonals(y, x, 'positive')
      x += 1
      break if x == @width
    end
  end

  def check_diagonal_down
    # Direction: topright -> topleft -> downleft
    y = @height - 1
    x = @width - 1
    loop do
      check_diagonals(y, x, 'negative')
      x -= 1
      break if x.zero?
    end
    loop do
      check_diagonals(y, x, 'negative')
      y -= 1
      break if y.negative?
    end
  end

  def check_diagonals(y, x, slope)
    @checker.reset
    if slope == 'positive'
      until y == @height || x == @width
        field = @board[y][x]
        (@winner = field and return) if @checker.winner?(field)
        y += 1; x += 1
      end
    elsif slope == 'negative'
      until y.negative? || x == @width
        field = @board[y][x]
        @winner = field and return if @checker.winner?(field)
        y -= 1; x += 1
      end
    end
  end
end
