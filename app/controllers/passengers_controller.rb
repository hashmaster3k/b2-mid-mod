class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def destroy
    passenger = PassengerFlight.where(flight_id: params[:flight_id]).find_by(passenger_id: params[:id])
    passenger.destroy
    redirect_to flights_path
  end
end
