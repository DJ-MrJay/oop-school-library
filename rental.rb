class Rental
  attr_accessor :date, :book, :person, :rentals
  attr_reader :id

  def initialize(person, book, date)
    @date = date

    @person = person
    person&.rentals&.push(self)

    @book = book
    book&.rentals&.push(self)
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
