class PassengerFlightsController < ApplicationController
  def destroy
    PassengerFlight.remove_passenger_from_flight(params[:flight_id], params[:id])
    redirect_to flights_path
  end
end
