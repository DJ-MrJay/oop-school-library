require_relative './person'

class Student < Person
  attr_reader :classroom

<<<<<<< HEAD
  def initialize(name, age, parent_permission, id = Random.rand(1..1000))
    super(name, id, age, parent_permission: parent_permission)
=======
  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
>>>>>>> b8e832aa4d7b001051e2e761a21f0fd3d54e1171
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => name,
      'age' => @age,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end
end
