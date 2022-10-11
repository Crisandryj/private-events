class EventsController < ApplicationController

  
  def index
    @events = Event.all
  end

  def create
    @event = current_user.create_event(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:title,:date)
  end
end
