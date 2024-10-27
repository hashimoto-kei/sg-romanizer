require_relative './ideromanizer'
require_relative './romanizer_impl'

class DeromanizerImplSimple
  include IDeromanizer

  def initialize()
    @romanizer_impl = RomanizerImpl.new
  end

  def deromanize(roman)
    for arabian in 1..3999 do
      if roman == @romanizer_impl.romanize(arabian)
        return arabian
      end
    end
  end
end
