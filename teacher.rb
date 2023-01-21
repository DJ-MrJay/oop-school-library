require_relative './person'

class Teacher < Person
  attr_accessor :specialization
  attr_reader :json_class

  def initialize(age, specialization, name = 'Unknown', parent_permission: true, json_class: 'Teacher')
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @json_class = json_class
  end

  def can_use_services?
    true
  end

  # def to_json(*args)
  #   {
  #     JSON.create_id => self.class.name,
  #     'id' => @id,
  #     'name' => name,
  #     'age' => @age,
  #     'specialization' => @specialization
  #   }.to_json(*args)
  # end
end
