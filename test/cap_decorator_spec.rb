require_relative '../cap_decorator'
require_relative '../nameable'
require_relative '../person'

describe CapitalizeDecorator do
  before :each do
    @new_person = Person.new(20, 'selma')
    @new_cap_decorator = CapitalizeDecorator.new(@new_person)
  end

  it 'CapitalizeDecorator should inherit from Decorator' do
    expect(@new_cap_decorator).to be_kind_of(Decorator)
  end

  it 'CapitalizeDecorator should capitalize the return value of person instance' do
    expect(@new_cap_decorator.correct_name).to eql('Selma')
  end
end
