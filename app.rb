require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './book'
require_relative './rental'
require_relative './io'

class App
  attr_accessor :books, :people, :rentals

  include SaveData
  include LoadData

  def initialize
    @books = load_books
    @people = load_people
    @rentals = load_rentals
  end

  def list_books
    load_books
    if @books.empty?
      puts
      puts 'No books found'
    else
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts
      puts 'No people found'
    else
      @people.each_with_index do |person, index|
        puts "#{index})- [#{person.class}] Age: #{person.age}, Name: #{person.name}, ID: #{person.id}"
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp.split.map(&:capitalize).join(' ')
    print 'Author: '
    author = gets.chomp.split.map(&:capitalize).join(' ')
    book = Book.new(title, author)
    books << book
    puts
    puts 'Book created successfully'
    save_books
  end

  def create_person
    print 'Do you want to create (1) a student or (2) a teacher? [Input the number]: '
    num_input = gets.chomp.to_i
    person_option(num_input)
  end

  def person_option(num_input)
    case num_input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid Entry'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp.split.map(&:capitalize).join(' ')

    print 'Has parent\'s permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    student_item = Student.new(age, name, parent_permission: parent_permission)
    people << student_item
    save_people
    puts
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp.split.map(&:capitalize).join(' ')

    print 'Specialization: '
    specialization = gets.chomp.downcase

    teacher_item = Teacher.new(age, name, specialization)
    people << teacher_item
    save_people
    puts
    puts 'Teacher created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    selected_book = gets.chomp.to_i
    puts 'Select a person from the following list by number'
    list_people
    selected_person = gets.chomp.to_i
    print 'Date (DD/MM/YYYY): '
    date = gets.chomp
    book = @books[selected_book]
    person = @people[selected_person]
    rental = Rental.new(person, book, date)
    rentals << rental
    save_rentals
    puts
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    @rentals.each do |rental|
      puts %(Date: #{rental.date}, Book: "#{rental.book.title}" by #{rental.book.author}) if rental.person.id == id
    end
  end
end
