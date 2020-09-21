require 'rails_helper'

RSpec.describe Passenger do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe 'relationships' do
    it { should have_many :passenger_flights }
    it { should have_many(:flights).through(:passenger_flights) }
  end

  describe 'object creation' do
    it 'can make a new object' do
      Passenger.create!(name: 'Billy Joel', age: 49)
      expect(Passenger.count).to eq(1)
    end
  end

  describe 'Instance Methods' do
    it '.total_flights' do
      southwest = Airline.create!(name: 'Southwest Airlines')
      flight_1 = southwest.flights.create!
      bob = flight_1.passengers.create!(name: 'Bob', age: 30)
      hannah = flight_1.passengers.create!(name: 'Hanna', age: 32)

      frontier = Airline.create!(name: 'Frontier Airlines')
      flight_2 = frontier.flights.create!
      flight_2.passengers << hannah

      expect(bob.total_flights).to eq(1)
      expect(hannah.total_flights).to eq(2)
    end
  end
end
