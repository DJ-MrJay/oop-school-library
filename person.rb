require_relative './nameable'

class Person < Nameable
  attr_accessor :age, :name, :id, :rentals

  def initialize(age, id, name = 'Unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    @parent_permission || of_age?

    false
  end

  def add_rental(price)
    @rentals << price
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
