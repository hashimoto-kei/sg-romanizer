require_relative './iromanizer'
require_relative './roman_symbol'

class RomanizerImpl
  include IRomanizer

  def romanize(arabian)
    digits = to_digits(arabian)
    ret = ''
    digits.each_with_index{|digit, i|
      place = digits.length - i
      ret << to_roman(place, digit)
    }
    puts ret
    return ret
  end

  def to_digits(arabian)
    string = arabian.to_s
    ret = []
    for char in string.chars do
      digit = char.to_i
      ret << digit
    end
    return ret
  end

  def to_roman(place, digit)
    unit_id = 2 * place - 2
    unit = RomanSymbol.to_symbol(unit_id)
    if digit <= 3
      return unit * digit
    end
    base5 = RomanSymbol.to_symbol(unit_id + 1)
    if digit == 4
      return unit + base5
    end
    if digit <= 8
      return base5 + unit * (digit - 5)
    end
    base10 = RomanSymbol.to_symbol(unit_id + 2)
    if digit == 9
      return unit + base10
    end
  end
end
