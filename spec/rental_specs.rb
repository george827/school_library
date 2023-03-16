require './rental'
require './book'
require './person'
require 'json'

RSpec.describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new('John Doe') }
  let(:rental) { Rental.new('2023-03-16', book, person) }

  describe '#initialize' do
    it 'sets the date attribute' do
      expect(rental.date).to eq '2023-03-16'
    end

    it 'sets the book attribute' do
      expect(rental.book).to eq book
    end

    it "adds the rental to the book's rentals array" do
      expect(book.rentals).to include rental
    end

    it 'sets the person attribute' do
      expect(rental.person).to eq person
    end

    it "adds the rental to the person's rentals array" do
      expect(person.rentals).to include rental
    end

    it "does not add the rental to the person's rentals array if it already exists" do
      Rental.new('2023-03-16', book, person)
      expect(person.rentals.count).to eq 1
    end
  end

  describe '#to_json' do
    it 'returns a JSON formatted string' do
      json_string = JSON.generate({
                                    'date' => rental.date,
                                    'book' => rental.book,
                                    'person' => rental.person
                                  })
      expect(rental.to_json).to eq json_string
    end
  end
end
