class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @creator = current_user
    @event = @creator.created_events.create(event_params)
    if @event.save
    redirect_to root_path, notice: "Event was saved"
    else
      flash[:alert] = @event.errors.count
      redirect_to root_path, alert: 'Event was not created.'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title,:date)
  end
end
