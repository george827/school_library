require './app'
require './writer'

class Main
  def show_list
    puts 'Please choose an option by entering a number'
    action_list = {
      '1': 'List all books',
      '2': 'List all people',
      '3': 'Create a person',
      '4': 'Create a book',
      '5': 'Create a rental',
      '6': 'List all rentals for a given person id',
      '7': 'Exit'
    }

    action_list.each do |index, action|
      puts "#{index} - #{action}"
    end
  end

  def mainfunc
    puts "Welcome to School Library App!\n\n"
    app = App.new
    loop do
      show_list
      continue(app)
    end
  end

  def continue(app)
    choice = gets.chomp
    case choice
    when '1' then app.list_all_books
    when '2' then app.list_all_people
    when '3' then app.create_person
    when '4' then app.create_book
    when '5' then app.create_rental
    when '6' then app.list_rentals_of_person_id
    when '7'
      # create a new file with the current data
      Writter.write(app.people, app.books, app.rentals)
      puts 'Thank you for using this app!'
      exit
    end
  end
end

main = Main.new
main.mainfunc
