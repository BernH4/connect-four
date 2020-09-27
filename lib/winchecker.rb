class WinChecker
  def initialize
    @counter = 1 # Es ist immer einer in einer Reihe
    # current_player = ''
    @field_before = ''
  end

  def winner?(field)
    if @field_before == field then @counter += 1
    else
      @counter = 1
      # If no player has a stone in this field write nothing in field before, elso write player
      field == "-" ? field_before = "" : @field_before = field
    end
    @counter == 4 ? true : false
  end
end
