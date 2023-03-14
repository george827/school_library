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

        data = Writter.morph(data)

        objects = data + objects
      end

      File.write(file, JSON.pretty_generate(objects.map(&:to_json)))
    end
  end

  def self.morph(data)
    data.map do |d|
      if d.instance_of?(Person)
        Person.new(d['name'], d['age'], parent_permission: d['parent_permission'])
      elsif d.instance_of?(Book)
        Book.new(d['title'], d['author'])
      elsif d.instance_of?(Rental)
        Rental.new(d['date'], d['book'], d['person'])
      end
    end
  end
end
