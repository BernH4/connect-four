# frozen_string_literal: true

module Display
  def code_colors(number)
    cc = {
      'X' => "\e[101m  X  \e[0m ",
      'O' => "\e[44m  O  \e[0m ",
      '-' => "\e[100m  -  \e[0m "
    }
    cc.default = "\e[93;44m  #{number}  \e[0m "
    cc[number]
  end

  def gen_game_board(height, width)
    @height = height
    @width = width
    game_board = Array.new(@height) { Array.new(@width, '-') }
  end

  def print_board(board)
    # binding.pry
    board[0].length.times do |i|
      if i.zero?
        print '      '
        next
      end
      print code_colors(i)
    end
    print " #{print code_colors(board[0].length)} \n\n"
    (board.length - 1).downto(0) do |i|
      print code_colors(i + 1)
      board[i].each { |num| print code_colors(num) }
      print "\n\n"
    end
  end
end
