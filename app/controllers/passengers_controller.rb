class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def destroy
    passenger = PassengerFlight.find_specific_passenger_by_flight(params[:flight_id], params[:id])
    passenger.destroy
    redirect_to flights_path
  end
end
