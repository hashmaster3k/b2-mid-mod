require 'rails_helper'

RSpec.describe 'FLIGHTS INDEX PAGE' do
  before :each do
    @southwest = Airline.create!(name: 'Southwest Airlines')
    @flight_1 = @southwest.flights.create!
    @bob = @flight_1.passengers.create!(name: 'Bob', age: 30)
    @hannah = @flight_1.passengers.create!(name: 'Hanna', age: 32)

    @flight_2 = @southwest.flights.create!
    @tina = @flight_2.passengers.create!(name: 'Tina', age: 30)
    @flight_2.passengers << @hannah
  end

  it 'should list all flight numbers and their respective passengers' do
    visit '/flights'

    within "#flight-#{@flight_1.id}" do
      expect(page).to have_content("Flight ##{@flight_1.id}")
      expect(page).to have_content("Passengers:")
      expect(page).to have_content(@bob.name)
      expect(page).to have_content(@hannah.name)

    end

    within "#flight-#{@flight_2.id}" do
      expect(page).to have_content("Flight ##{@flight_2.id}")
      expect(page).to have_content("Passengers:")
      expect(page).to have_content(@tina.name)
      expect(page).to have_content(@hannah.name)
    end
  end
end
