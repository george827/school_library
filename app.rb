require './rental'
require './student'
require './teacher'
require './book'

class App
  def initialize
    @books = []
    @people = []
  end

  def list_all_books
    if @books.empty?
      puts "please add a book\n\n"
    else
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
    show_list
    continue
  end

  def list_all_people
    if @people.empty?
      puts "please add a person\n\n"
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    show_list
    continue
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the nummber]: '
    case gets.chomp
    when '1'
      puts 'Enter student details'
      print 'Name : '
      name = gets.chomp
      print 'Age: '
      age = gets.chomp
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.downcase
      case permission
      when 'y' then parent_permission = true
      when 'n' then parent_permission = false
      end
      @people.push(Student.new(age, name, parent_permission))
      puts "Person Student Created successfully\n\n"

    when '2'
      puts 'Enter Teacher details'
      print 'Name: '
      name = gets.chomp
      print 'Age: '
      age = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      @people.push(Teacher.new(age, name, specialization))
      puts "Person Teacher Created successfully\n\n"
    end
    show_list
    continue
  end

  def create_book
    puts 'Enter Book details'
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))

    puts "Book Created successfully \n\n"
    show_list
    continue
  end

  def list_all_books_with_numbers
    if @books.empty?
      puts 'Please insert books first!!'
      show_list
      continue
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_person_with_numbers
    if @people.empty?
      puts 'Please insert people first!!'
      show_list
      continue
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_rental()
    puts 'Select a book from the following list by number'
    list_all_books_with_numbers
    book_option = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    list_all_person_with_numbers
    person_option = gets.chomp.to_i

    puts 'Date: '
    date = gets.chomp
    Rental.new(date, @books[book_option], @people[person_option])

    puts 'Rental created successfully'
    show_list
    continue
  end

  def list_rentals_of_person_id()
    print 'Id of person: '
    id = gets.chomp.to_i
    person_arr = @people.select { |person| person.id == id }

    if person_arr.empty?
      puts 'No person matches the given ID!!'
    else
      print 'Rentals:'
      person_arr[0].rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
    show_list
    continue
  end

  def continue
    case gets.chomp
    when '1' then list_all_books
    when '2' then list_all_people
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then list_rentals_of_person_id
    when '7'
      puts 'Thank you for using this app!'
      exit
    end
  end
end
