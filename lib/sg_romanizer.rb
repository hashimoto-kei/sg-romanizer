require_relative './ideromanizer'
require_relative './iromanizer'
require_relative './deromanizer_impl_simple'
require_relative './romanizer_impl'

class SgRomanizer
  include IRomanizer
  include IDeromanizer

  def initialize()
    @romanizer_impl = RomanizerImpl.new
    @deromanizer_impl = DeromanizerImplSimple.new
  end

  def romanize(arabian)
    return @romanizer_impl.romanize(arabian)
  end

  def deromanize(roman)
    return @deromanizer_impl.deromanize(roman)
  end
end
