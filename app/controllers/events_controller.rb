class EventsController < ApplicationController
  before_action do
    @location = Location.find(params[:location_id])
  end

  # GET    /locations/:location_id/events    events#index
  def index
    @events = @location.events
  end

  # GET    /locations/:location_id/events/:id  events#show
  def show
    @event = Event.find(params[:id])
    ensure_location_match
  end

  #GET    /locations/:location_id/events/:id/edit   events#edit
  def edit
    @event = Event.find(params[:id])
  end

  # PATCH  /locations/:location_id/events/:id    events#update
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to [@location, @event]
    else
      redirect_back_or_to [@location, @event]
    end
  end

  #GET    /locations/:location_id/events/new     events#new
  def new
    @event = Event.new
  end

  # POST   /locations/:location_id/events  events#create
  def create
    @event = Event.new(event_params)
    @event.location = @location

    if @event.save
      redirect_to [@location, @event]
    else
      redirect_to new_location_event_path
    end
  end

  # DELETE /locations/:location_id/events/:id   events#destroy
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to location_events_path
  end

  def ensure_location_match
    if @event.location != @location
      not_found
    end
  end

  def event_params
    params.require(:event).permit(:name, :date, :capacity)
  end
end
