# frozen_string_literal: true

class Player
  include Display

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @last_x = -1
    @last_y = -1
    @last_board = []
  end

  def move(board)
    @last_board = board
    puts "\e[H\e[2J"
    print_board(board)
    puts "#{@name} choose a field! e.g.: x, y"
    loop do
      input = gets.chomp
      unless input =~ /[1-9]+,\s*?[1-9]+/
        puts 'Invalid input, format: x,y'
        next
      end
      @last_x, @last_y = input.split(',').map(&:to_i)
      # Change to array notation with index 0
      @last_x -= 1
      @last_y -= 1
      break unless outside_board || already_taken
    end
    # Make sure symbol is placed at the lowest position
    drop
  end

  def drop
    # Clear terminal
    puts "\e[H\e[2J"
    while @last_board[@last_y - 1][@last_x] == '-' && @last_y != 0
      @last_board[@last_y][@last_x] = @symbol
      print_board(@last_board)
      sleep(0.4)
      @last_board[@last_y][@last_x] = '-'
      puts "\e[H\e[2J"
      @last_y -= 1
    end
    @last_board[@last_y][@last_x] = @symbol
  end

  def outside_board
    max_x = @last_board[0].length - 1
    max_y = @last_board.length - 1
    if @last_y > max_y || @last_x > max_x
      puts "Invalid coordinates! 0 - #{max_x}, 0 - #{max_y}"
      true
    end
  end

  def already_taken
    field = @last_board[@last_y][@last_x]
    return false if field == '-'
    puts 'Sorry already taken!'
    return true
  end
end
