class Rental
  attr_accessor :date, :book, :person, :rentals
  attr_reader :id

  def initialize(person, book, date)
    @date = date

<<<<<<< HEAD
    @person = person
    person&.rentals&.push(self)

    @book = book
    book&.rentals&.push(self)
=======
    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
>>>>>>> b8e832aa4d7b001051e2e761a21f0fd3d54e1171
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => @date,
      'book' => @book,
      'person' => @person
    }.to_json(*args)
  end
end
