require './nameable'

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end
  attr_accessor :nameable

  def correct_name
    @naeable.correct_name
  end
end
