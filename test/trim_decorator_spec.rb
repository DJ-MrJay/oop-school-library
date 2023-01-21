require_relative '../trim_decorator'
require_relative '../nameable'
require_relative '../person'

describe TrimmerDecorator do
  it 'Should inherit form Decorator' do
    trim_decorator = TrimmerDecorator.new('visto')

    expect(trim_decorator).to be_kind_of(Decorator)
  end

  it 'name should have no more than 10 characters' do
    new_person = Person.new(24, 'foodIsSoNice')

    trim_decorator = TrimmerDecorator.new(new_person)

    expect(trim_decorator.correct_name).to eql('foodIsSoNi')
  end
end
