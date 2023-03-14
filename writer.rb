require_relative 'person'
require_relative 'book'
require_relative 'rental'

class Writter
    def self.write(people, books, rentals)
      files = {
        "people.json" => people,
        "rentals.json" => rentals,
        "books.json" => books
      }

      files.each do |file, objects|
        if File.exist?(file) and !File.zero?(file)
          data = JSON.parse(File.read(file))

          data = data.map do |d|
            if d.class == Person
              Person.new(d['name'], d['age'], parent_permission: d['parent_permission'])
            elsif d.class == Book
              Book.new(d['title'], d['author'])
            elsif d.class == Rental
              Rental.new(d['date'], d['book'], d['person'])
            end
          end

          objects = data + objects
        end

        File.open(file, "w") do |f|
          f.write(JSON.pretty_generate(objects.map(&:to_json)))
        end
      end
    end
end