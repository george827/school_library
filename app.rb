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
        @books.each do |book|
            puts "Title: #{book.title}, Author: #{book.author}"
        end
        display_list
        continue
    end

    def list_all_people
        @people.each do |person|
            puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
        display_list
        continue
    end

    def create_person
        puts "Do you want to create a student (1) or a teacher (2)? [Input the nummber]: "

        case gets.chomp
        when '1'
            puts "Enter student details"
            puts "Name : "
            name = gets.chomp

            puts "Age: "
            age = gets.chomp

            puts "Has parent permission? [Y/N]: "
            permission = gets.chomp.downcase
            case permission
            when 'y' then parent_permission = true
            when 'n' then parent_permission = false
            end

            @people.push(Student.new(age, name, parent_permission))
            puts "Person Student Created successfully"

        when '2'
            puts "Enter Teacher details"
            puts "Age"
            age = gets.chomp

            puts "Name: "
            name = gets.chomp

            puts "Specialization: "
            specialization = gets.chomp

            @people.push(Teacher.new(age, name, specialization))
            puts "Person Teacher Created successfully"
        end
        display_list
        continue
    end

    def create_book
        puts "Enter Book details"
        puts "Title"
        title = gets.chomp

        puts "Author: "
        author = gets.chomp

        puts "Book Created successfully"
        display_list
        continue
    end
    
    def list_all_books_with_numbers
        if @books.empty?
          puts 'Please insert books first!!'
          display_list
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
          display_list
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
        display_list
        continue
    end

    def list_rentals_of_person_id()
        puts 'Id of person: '
        id = gets.chomp.to_i
        person_arr = @people.select { |person| person.id == id }
    
        if person_arr.empty?
          puts 'No person matches the given ID!!'
        else
          puts 'Rentals:'
          person_arr[0].rentals.each do |rental|
            puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
          end
        end
        display_list
        continue
    end

    def continue
        user_option = gets.chomp

        case user_option
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