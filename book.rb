require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(titlex, authorx)
    @title = titlex
    @author = authorx
    @rentals = []
  end

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  def to_json(*args)
    {
      title: @title,
      author: @author
    }.to_json(*args)
  end
end
