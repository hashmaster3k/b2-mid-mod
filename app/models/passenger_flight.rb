class PassengerFlight < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  def self.find_specific_passenger_by_flight(flight, person)
    where(flight_id: flight).find_by(passenger_id: person)
  end
end
