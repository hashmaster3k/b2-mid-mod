require 'rails_helper'

RSpec.describe 'PASSENGERS INDEX PAGE' do
  before :each do
    @southwest = Airline.create!(name: 'Southwest Airlines')
    @flight_1 = @southwest.flights.create!
    @bob = @flight_1.passengers.create!(name: 'Bob', age: 30)
    @hannah = @flight_1.passengers.create!(name: 'Hanna', age: 32)

    @frontier = Airline.create!(name: 'Frontier Airlines')
    @flight_2 = @frontier.flights.create!
    @tina = @flight_2.passengers.create!(name: 'Tina', age: 30)
    @flight_2.passengers << @hannah
  end

  it 'displays all unique passengers with their flights' do
    visit '/passengers'

    within "#passenger-#{@bob.id}" do
      expect(page).to have_content(@bob.name)
      expect(page).to have_content("Flights: 1")
    end

    within "#passenger-#{@hannah.id}" do
      expect(page).to have_content(@hannah.name)
      expect(page).to have_content("Flights: 2")
    end

    within "#passenger-#{@tina.id}" do
      expect(page).to have_content(@tina.name)
      expect(page).to have_content("Flights: 1")
    end
  end
end
