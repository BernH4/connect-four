require 'pry'
require_relative 'display.rb'
class Game
  attr_reader :board
  include Display
  def initialize(p1, p2)  
    @p1 = p1
    @p2 = p2
    @board = default_board_arr
    binding.pry
  end
end
Game.new("a","b")
