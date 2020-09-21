require 'rails_helper'

RSpec.describe Passenger do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }

  end

  # describe 'relationships' do
  #   it { should have_many :flights }
  # end

  describe 'object creation' do
    it 'can make a new object' do
      Passenger.create!(name: 'Billy Joel', age: 49)
      expect(Passenger.count).to eq(1)
    end
  end
end
