require './person'

class Student < Person
  def initialize(classroom)
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
