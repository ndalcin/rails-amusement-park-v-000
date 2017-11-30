class RidesController < ApplicationController

  def take_ride
    @ride = Ride.new
    @ride.attraction = Attraction.find(params[:ride][:attraction_id])
    @ride.user = current_user
    @ride.save
    message = @ride.take_ride
    redirect_to user_path(@ride.user), notice: message
  end


end
