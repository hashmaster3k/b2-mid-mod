class PassengerFlight < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  def self.remove_passenger_from_flight(flight, person)
    where(flight_id: flight).find_by(passenger_id: person).destroy
  end
end
