require './decorator'

class Capitalizedecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
