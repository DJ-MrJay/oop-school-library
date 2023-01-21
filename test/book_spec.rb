require_relative '../book'
require_relative '../student'
require_relative '../person'
require_relative '../rental'

describe Book do
  before :each do
    @new_book = Book.new('Book1', 'Selma')
  end

  it 'Inserted data should match attributes' do
    title = @new_book.title
    author = @new_book.author

    expect(title).to eql 'Book1'
    expect(author).to eql 'Selma'
  end

  it 'Rental instance should be created' do
    new_person = Person.new('Bubu', 3)
    expect_obj = @new_book.add_rental(new_person, '2023/01/21')

    expect(expect_obj).to be_instance_of(Rental)
  end
end
