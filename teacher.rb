require_relative './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(name, age, specialization, id = Random.rand(1..1000))
    super(age, name, id)
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
