require 'rails_helper'

RSpec.describe Flight do
  describe 'relationships' do
    it { should belong_to :airline }
  end

  describe 'object creation' do
    it 'can make a new object' do
      swa = Airline.create!(name: 'Southwest Airlines')
      swa.flights.create!
      expect(Flight.count).to eq(1)
    end
  end
end
