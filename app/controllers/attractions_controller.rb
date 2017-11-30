class AttractionsController < ApplicationController


  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new
    @attraction.name = params[:attraction][:name]
    @attraction.min_height = params[:attraction][:min_height]
    @attraction.happiness_rating = params[:attraction][:happiness_rating]
    @attraction.nausea_rating = params[:attraction][:nausea_rating]
    @attraction.tickets = params[:attraction][:tickets]
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.find_by(attraction_id: @attraction.id)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    
  end

end
