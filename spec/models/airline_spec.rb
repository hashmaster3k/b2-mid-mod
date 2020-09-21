require 'rails_helper'

RSpec.describe Airline do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :flights }
    it { should have_many(:passengers).through(:flights) }
  end

  describe 'object creation' do
    it 'can make a new object' do
      Airline.create!(name: 'Southwest Airlines')
      expect(Airline.count).to eq(1)
    end
  end

  describe 'Instance Methods' do
    it '.unique_passenger_list' do
      airline = Airline.create!(name: 'Southwest Airlines')

      flight_1 = airline.flights.create!
      bob = flight_1.passengers.create!(name: 'Bob', age: 30)
      hannah = flight_1.passengers.create!(name: 'Hanna', age: 32)

      flight_2 = airline.flights.create!
      tina = flight_2.passengers.create!(name: 'Tina', age: 30)
      flight_2.passengers << hannah

      expected = [bob, hannah, tina]

      expect(airline.unique_passenger_list).to eq(expected)
    end
  end
end
