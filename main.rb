require_relative './app'

def main
  app = App.new
  app.entry_point
end

def options(input)
  case input
  when 1
    list_books
  when 2
    list_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_rentals
  else
    exit_app(app)
  end
end

def exit_app(_app)
  puts 'Thank you for using this app! Now exiting...'
  exit
end

main
