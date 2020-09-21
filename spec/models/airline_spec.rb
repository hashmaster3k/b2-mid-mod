require 'rails_helper'

RSpec.describe Airline do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :flights }
  end

  describe 'object creation' do
    it 'can make a new object' do
      Airline.create!(name: 'Southwest Airlines')
      expect(Airline.count).to eq(1)
    end
  end
end
