require 'json'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

module SaveData
  def save_books
    # books_data = []
    return unless File.exist?('./storage_files/books.json')
    return unless @books.any?

    books_data = JSON.generate(@books, { max_nesting: false })
    File.write('./storage_files/books.json', books_data)
  end

  def save_people
    # people_data = []
    return unless File.exist?('./storage_files/people.json')
    return unless @people.any?

    people_data = JSON.generate(@people, { max_nesting: false })
    File.write('./storage_files/people.json', people_data)
  end

  def save_rentals
    # rentals_data = []
    return unless File.exist?('./storage_files/rentals.json')
    return unless @rentals.any?

    rentals_data = JSON.generate(@rentals, { max_nesting: false })
    File.write('./storage_files/rentals.json', rentals_data)
  end
end

module LoadData
  def load_books
    books = []
    if File.exist?('./storage_files/books.json')
      data = File.read('./storage_files/books.json')
      if data != ''
        JSON.parse(data).map do |book|
          books.push(Book.new(book['title'], book['author']))
        end
      end
    end
    books
  end

  def load_people
    people = []
    if File.exist?('./storage_files/people.json')
      data = File.read('./storage_files/people.json')
      if data != ''
        JSON.parse(data).map do |person|
          if person['json_class'] == 'Student'
            people.push(Student.new(person['name'], person['age'], person['parent_permission'], person['id']))
          else
            people.push(Teacher.new(person['name'], person['age'], person['specialization'], person['id']))
          end
        end
      end
    end
    people
  end

  def load_rentals
    rentals = []
    if File.exist?('./storage_files/rentals.json')
      data = File.read('./storage_files/rentals.json')
      if data != ''
        JSON.parse(data).map do |rental|
          person_id = rental['person']['id']
          book_id = rental['book']['id']
          s = Rental.new(get_person(person_id), get_book(book_id), rental['date'])
          rentals.push(s)
        end
      end
    end
    rentals
  end

  def get_person(id)
    @people.find { |person| person.id == id }
  end

  def get_book(id)
    @books.find { |book| book.id == id }
  end
end
