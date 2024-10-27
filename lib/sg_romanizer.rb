class SgRomanizer
  ROMAN_SYMBOLS = ["I", "V", "X", "L", "C", "D", "M"]

  def romanize(arabic)
    ret = ''
    digits = to_digits(arabic)
    digits.each_with_index{|digit, i|
      place = digits.length - i
      ret << to_roman(place, digit)
    }
    return ret
  end

  def to_digits(arabic)
    ret = []
    for char in arabic.to_s.chars do
      digit = char.to_i
      ret << digit
    end
    return ret
  end

  def to_roman(place, digit)
    unit_index = 2 * place - 2
    unit = ROMAN_SYMBOLS[unit_index]
    if digit <= 3
      return unit * digit
    end
    base5 = ROMAN_SYMBOLS[unit_index + 1]
    if digit == 4
      return unit + base5
    end
    if digit <= 8
      return base5 + unit * (digit - 5)
    end
    base10 = ROMAN_SYMBOLS[unit_index + 2]
    if digit == 9
      return unit + base10
    end
  end

  def deromanize(roman)
    for arabic in 1..3999 do
      if roman == romanize(arabic)
        return arabic
      end
    end
  end
end
