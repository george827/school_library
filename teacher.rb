require './person'

class Teacher < Person
  def initialize(age, name, specialization, id: Random.rand(1..1000))
    super(age, name, parent_permission: true, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      'type' => 'Teacher',
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'specialization' => @specialization,
      'parent_permission' => 'true'
    }.to_json(*args)
  end
end
