class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_json(*args)
    {
      'date' => @date,
      'book' => @book,
      'person' => @person
    }.to_json(*args)
  end
end
