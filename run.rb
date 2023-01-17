require_relative './app'

class Run
  def initialize
    @app = App.new
  end

  def entry_point
    puts 'Welcome to School Library App!'

    loop do
      app_options
      app_choice = gets.chomp.to_i
      break if app_choice == 7

      options(app_choice)
    end
  end

  def app_options
    puts
    puts 'Please choose an option by entering a number:'
    options = [
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - Exit'
    ]
    puts
    puts options
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def options(input)
    case input
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals
    when 7
      puts 'Thanks for using the school library!'
      exit
    else
      puts 'Invalid Entry'
      puts 'Please enter a number between 1 and 7'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
