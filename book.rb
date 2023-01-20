require './rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @id = Random.rand(1..100)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end
end
