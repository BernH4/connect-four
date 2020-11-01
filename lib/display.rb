module Display

  def code_colors(number)
    {
      'X' => "\e[101m  X  \e[0m ",
      'O' => "\e[44m  O  \e[0m ",
      '-' => "\e[100m  -  \e[0m "
    }[number]
  end

  def gen_game_board(height, width)
    @height = height
    @width = width
    game_board = Array.new(@height) { Array.new(@width, "-") } 
  end

  # def print_board
  #   # binding.pry
  #   (@height-1).downto(0) do |i|
  #     @board[i].each { |num| print code_colors(num) }
  #     print "\n\n"
  #   end
  # end
  #
  def print_board(board)
    # binding.pry
    (board.length - 1).downto(0) do |i|
      board[i].each { |num| print code_colors(num) }
      print "\n\n"
    end
  end
end
