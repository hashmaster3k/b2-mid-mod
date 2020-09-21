class PassengersController < ApplicationController
  def destroy
    passenger = PassengerFlight.where(flight_id: params[:flight_id]).find_by(passenger_id: params[:id])
    passenger.destroy
    redirect_to flights_path
  end
end
