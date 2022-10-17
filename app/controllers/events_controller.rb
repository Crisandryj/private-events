class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = current_user.created_events.build(event_params)
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

 def update
    @event = Event.find(params[:id])
    @event.attendees << params[:event][:attendee]

 # raise params.inspect
end

  private

  def event_params
    params.require(:event).permit(:title,:date)
  end
end
