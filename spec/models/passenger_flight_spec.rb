require 'rails_helper'

RSpec.describe PassengerFlight do
  describe 'relationships' do
    it { should belong_to :passenger }
    it { should belong_to :flight }
  end

  describe 'object creation' do
    it 'can make a new object' do
      airline = Airline.create!(name: 'Southwest Airlines')
      flight = airline.flights.create!
      billy = Passenger.create!(name: 'Billy Joel', age: 49)

      PassengerFlight.create!(flight_id: flight.id, passenger_id: billy.id)
      expect(PassengerFlight.count).to eq(1)
    end
  end

  describe 'Class Methods' do
    it 'remove_passenger_from_flight()' do
      southwest = Airline.create!(name: 'Southwest Airlines')
      flight = southwest.flights.create!
      bob = flight.passengers.create!(name: 'Bob', age: 30)
      hannah = flight.passengers.create!(name: 'Hanna', age: 32)

      expect(PassengerFlight.all.count).to eq(2)
      PassengerFlight.remove_passenger_from_flight(flight.id, bob.id)
      expect(PassengerFlight.all.count).to eq(1)
    end
  end
end
