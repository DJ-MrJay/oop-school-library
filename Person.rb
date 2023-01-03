class Person
  attr_accessor :name, :age
  attr_reader :id, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..500)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def is_of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end
end