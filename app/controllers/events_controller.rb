class EventsController < ApplicationController
  def index
    # @events = Event.all
    if params[:event_search].present?
      q = "%#{params[:event_search]}%"
      @events = Event.where("name iLIKE ?", q).last(10)
    end
  end

  def show
    @event = Event.find(params[:id])
    @total_trips = @event.trips.count
    @total_carbon = @event.total(:carbon)
    @total_km = @event.total(:km_travelled)
    # @total_trees = @event.total_trees
    @total_pledge = @event.pledges.count
  end

end
