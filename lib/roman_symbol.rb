module RomanSymbol
  ROMAN_SYMBOLS = ["I", "V", "X", "L", "C", "D", "M"]

  def self.to_symbol(id)
    return ROMAN_SYMBOLS[id]
  end
end
