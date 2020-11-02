# frozen_string_literal: true

# It saves the last field it was called on and counts same colors in a
# row feeded to the method(X or O)
#
class WinChecker
  def initialize
    @counter = 1 # Theres always one in a row
    @field_before = ''
  end

  def reset
    initialize
  end

  def winner?(field)
    if @field_before == field then @counter += 1
    else
      @counter = 1
      # If no player has a stone in this field write nothing in field before, elso write player
      field == '-' ? field_before = '' : @field_before = field
    end
    @counter == 4 ? true : false
  end
end
