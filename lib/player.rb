class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @last_x = -1
    @last_y = -1
  end

  def move
    puts "#{@name} choose a field! e.g.: 2, 4"
    @last_x, @last_y = gets.chomp.split(",")
    return if outside_board || already_taken
    puts "works"
  end

  private

  def outside_board
    binding.pry
    #TODO Game not acessible from here
    if game.board[@last_y][@last_x].nil?
      puts "Invalid coordinates! 0 - #{Game.width}, 0 - #{Game.height}"
    end
  end

  def already_taken
    field = game.board[@last_y][@last_x]
    return false if field == "-"
    puts "Sorry already taken!"
  end

end
