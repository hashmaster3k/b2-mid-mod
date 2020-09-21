require 'rails_helper'

RSpec.describe 'AIRLINES SHOW PAGE' do
  before :each do
    @southwest = Airline.create!(name: 'Southwest Airlines')
    @flight_1 = @southwest.flights.create!
    @bob = @flight_1.passengers.create!(name: 'Bob', age: 30)
    @hannah = @flight_1.passengers.create!(name: 'Hanna', age: 32)

    @flight_2 = @southwest.flights.create!
    @tina = @flight_2.passengers.create!(name: 'Tina', age: 30)
    @flight_2.passengers << @hannah
  end

  it 'should display a list of unique passengers from all flights for this airline' do
    visit "/airlines/#{@southwest.id}"

    expect(page).to have_content(@bob.name).once
    expect(page).to have_content(@hannah.name).once
    expect(page).to have_content(@tina.name).once
  end
end
