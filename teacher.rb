require_relative './person'

class Teacher < Person
  attr_reader :specialization

<<<<<<< HEAD
  def initialize(name, age, specialization, id = Random.rand(1..1000))
    super(name, age, id)
=======
  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
>>>>>>> b8e832aa4d7b001051e2e761a21f0fd3d54e1171
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => name,
      'age' => @age,
      'specialization' => @specialization
    }.to_json(*args)
  end
end
