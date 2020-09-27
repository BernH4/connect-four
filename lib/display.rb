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
    game_board = {}

    @height.downto(1) do |i|
      game_board[:"line#{i}"] = ['-'] * @width 
    end
    game_board
  end

  def print_board
    @height.downto(1) do |i|
      @board[:"line#{i}"].each { |num| print code_colors(num) }
      print "\n\n"
    end
  end
end
