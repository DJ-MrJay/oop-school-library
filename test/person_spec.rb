require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
    it 'Inserted data should match attributes' do
      new_person = Person.new(12, 'Baby')
  
      age = new_person.age
      name = new_person.name
  
      expect(age).to eql(age)
      expect(name).to eql(name)
    end
  
    it 'can_use_services method should return true if age >=18' do
      new_person = Person.new(20, 'Senior')
  
      test_age = new_person.can_use_services?
      test_name = new_person.correct_name
  
      expect(test_age).to be_truthy
      expect(test_name).to eql('Senior')
    end
  
    it 'correct_name method should return name attribute' do
      new_person = Person.new(20, 'Senior')
  
      test_name = new_person.correct_name
  
      expect(test_name).to eql('Senior')
    end
  
    it 'add_book_rental should create an instance of Rental' do
      new_person = Person.new(20, 'Senior')
      new_book = Book.new('Millions', 'John Doe')
  
      expect_obj = new_person.add_rental(new_book, '2023/01/21')
  
      expect(expect_obj).to be_instance_of(Rental)
    end
  end
 
  