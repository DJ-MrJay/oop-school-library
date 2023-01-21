require_relative '../decorator'
require_relative '../nameable'
require_relative '../person'

describe Decorator do
  before :each do
    @new_person = Person.new(20, 'selma')
    @new_decorator = Decorator.new(@new_person)
  end

  it 'Decorator should should inherit from Nameable' do
    expect(@new_decorator).to be_kind_of(Nameable)
  end

  it 'Nameable should be an instance of Person' do
    expect(@new_decorator.nameable).to be_instance_of(Person)
  end

  it 'correct_name should return name attribute from Person' do
    expect(@new_decorator.correct_name).to eql('selma')
  end
end
