class Airline < ApplicationRecord
  validates_presence_of :name
  has_many :flights
  has_many :passengers, through: :flights

  def unique_passenger_list
    passengers.distinct
  end
end
