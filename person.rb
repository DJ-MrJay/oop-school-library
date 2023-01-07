require_relative './nameable'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..500)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    @parent_permission || is_of_age?

    false
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
