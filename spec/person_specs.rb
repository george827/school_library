require './person'
require './book'
require './rental'
require 'date'

describe Person do
  let(:person) { Person.new(25, 'Alice') }
  let(:book) { Book.new('Harry Potter', 'J.K. Rowling') }

  context '#initialize' do
    it 'should create a new person instance with the given age and name' do
      expect(person.age).to eq(25)
      expect(person.name).to eq('Alice')
    end

    it 'should set the parent_permission attribute to true by default' do
      expect(person.instance_variable_get(:@parent_permission)).to eq(true)
    end

    it 'should generate a random ID between 1 and 1000' do
      expect(person.id).to be_between(1, 1000)
    end

    it 'should initialize an empty array for rentals' do
      expect(person.rentals).to eq([])
    end
  end

  context '#add_rental' do
    it 'should add a new rental to the rentals array' do
      date = Date.new(2022, 3, 15)
      person.add_rental(date, book)

      expect(person.rentals.size).to eq(1)
      expect(person.rentals.first.date).to eq(date)
      expect(person.rentals.first.book).to eq(book)
      expect(person.rentals.first.person).to eq(person)
    end
  end

  context '#correct_name' do
    it 'returns the person\'s name' do
      expect(person.correct_name).to eq('Alice')
    end
  end

  context '#can_use_services?' do
    it 'returns true if the person is of age' do
      person.age = 19
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns true if the person is not of age but has parent permission' do
      person.age = 17
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is not of age and does not have parent permission' do
      person.age = 17
      person.instance_variable_set(:@parent_permission, false)
      expect(person.can_use_services?).to eq(false)
    end
  end
end
