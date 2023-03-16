require './capitalizedecorator'
require './trimmerdecorator'
require './nameable'
require './rental'
require 'json'
require_relative 'writer'

class Person < Nameable
  attr_accessor :rentals, :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true, id: Random.rand(1..1000))
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def to_json(*args)
    {
      'id' => @id,
      'name' => @name,
      'age' => @age
    }.to_json(*args)
  end

  private

  def of_age?
    @age >= 18
  end
end
