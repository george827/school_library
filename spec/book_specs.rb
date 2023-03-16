require 'json'
require 'rspec'
require './book'
require './rental'
require './person'
require 'date'

describe Book do
  let(:person) { Person.new(18, 'John Doe') }
  let(:book) { Book.new('title', 'author') }

  context '#add_rental' do
    it 'should add a rental to the rentals array' do
      expect {
        book.add_rental('1999/12/12', person)
      }.to change { book.rentals.count }.by(1)
    end
  end

  context '#to_json' do
    it 'should return a JSON string of the book object' do
      expected_json = { title: 'title', author: 'author' }.to_json
      expect(book.to_json).to eq(expected_json)
    end
  end
end
