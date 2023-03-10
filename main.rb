require './app'

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

def main
  puts "Welcome to School Library App!\n\n"
  app = App.new
  show_list
  app.continue
end

main
