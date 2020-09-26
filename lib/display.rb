module Display
  def default_board_arr
    Array.new(6) { Array.new(9, " ") }
  end

  def print_board(board_arr)
    puts "\n"
    board_arr.reverse.each do |line|
      line.each do |field|
        print "| #{field} "
      end
      print "|\n"
      puts "-" * 37
    end
  end
end
# include Display
# print_board(default_board_arr)
