require './person'

class Teacher < Person
  def initialize(age, name, specialization)
    super(age, name, parent_permission: true)
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
      'rentals' => @rentals,
      'specialization' => @specialization,
      'parent_permission' => 'true'
    }.to_json(*args)
  end
end
