class LocationsController < ApplicationController
  #  GET   /locations  locations#index
  def index
    @locations = Location.all
  end

  # GET   /locations/:id  locations#show
  def show
    @location = Location.find(params[:id])
    @events = @location.events
  end

  # GET    /locations/:id/edit    locations#edit
  def edit
    @location = Location.find(params[:id])
  end

  #   PATCH  /locations/:id    locations#update
  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to @location
    else
      redirect_back_or_to @location
    end
  end

  # GET    /locations/new   locations#new
  def new
    @location = Location.new
  end

 #   POST   /locations   locations#create
  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to locations_path
    else
      redirect_to new_location_path
    end
  end

  # DELETE /locations/:id   locations#destroy
  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_path
  end

  private
  def location_params
    params.require(:location).permit(:name, :city, :description, :image)
  end
end
