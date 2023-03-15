require_relative 'person'
require_relative 'book'
require_relative 'rental'

class Writter
  def self.write(people, books, rentals)
    files = {
      'people.json' => people,
      'rentals.json' => rentals,
      'books.json' => books
    }

    files.each do |file, objects|
      File.write(file, JSON.pretty_generate(objects.map(&:to_json)))
    end
  end

  def self.morph(data, file)
    data.map do |datu|
      d = JSON.parse(datu)

      case file
      when 'people.json'
        case d['type']
        when 'Student'
          Student.new(d['name'], d['age'], d['classroom'], parent_permission: d['parent_permission'], id: d['id'])
        when 'Teacher'
          Teacher.new(d['name'], d['age'], d['specialization'], id: d['id'])
        end
      when 'books.json'
        Book.new(d['title'], d['author'])
      when 'rentals.json'
        book = Book.new(d['book']['title'], d['book']['author'])
        person = Person.new(d['person']['name'], d['person']['age'], id: d['person']['id'])
        Rental.new(d['date'], book, person)
      end
    end
  end
end
