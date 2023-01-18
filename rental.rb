require './book'
require './person'

class Rental
  attr_accessor :date, :book, :person
  attr_reader :id

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book

    book.rentals << self
    person.rentals << self
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
