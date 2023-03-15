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
      if File.exist?(file) and !File.zero?(file)
        data = JSON.parse(File.read(file))
        
        data = Writter.morph(data, file)

        objects += data
      end

      File.write(file, JSON.s(objects.map(&:to_json)))
    end
  end

  def self.morph(data, file)
    return data.map do |datu|
      d = JSON.parse(datu)

      if file == 'people.json'
        if d['type'] == 'Student'
          Student.new(d['name'], d['age'], d['classroom'], parent_permission: d['parent_permission'])
        elsif d['type'] == 'Teacher'
          Teacher.new(d['name'], d['age'], d['specialization'])
        end
      elsif file == 'books.json'
        Book.new(d['title'], d['author'])
      elsif file == 'rentals.json'
        Rental.new(d['date'], d['book'], d['person'])
      end
    end
  end
end
