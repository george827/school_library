require './person'
class Student < Person
  attr_reader :classroom

  def initialize(age, name, classroom, parent_permission: true, id: Random.rand(1..1000))
    super(age, name, parent_permission: parent_permission, id: id)
    @parent_permission = parent_permission
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def to_json(*args)
    {
      'type' => 'Student',
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'classroom' => @classroom,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end
end