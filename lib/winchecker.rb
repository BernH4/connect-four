#TODO: Only one winchecker initialize at every new first call
class WinChecker
  def initialize
    @counter = 1 # Es ist immer einer in einer Reihe
    # current_player = ''
    @field_before = ''
    @test = 0
  end

  def reset
    initialize
  end

  def winner?(field)
    p field
    puts "Counter is at: #{@counter}"
    # p @test
    # @test += 1
    if @field_before == field then @counter += 1
    else
      @counter = 1
      # If no player has a stone in this field write nothing in field before, elso write player
      field == "-" ? field_before = "" : @field_before = field
    end
    @counter == 4 ? true : false
  end
end
