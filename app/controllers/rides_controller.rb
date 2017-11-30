class RidesController < ApplicationController
  def take_ride
    @attraction = Attraction.find(params[:attraction_id])
    @ride = Ride.find(params[:ride_id])
    if @ride.take_ride
      redirect_to user_path(@ride.user), notice: "Thanks for riding the #{@attraction.name}"
  end
end
