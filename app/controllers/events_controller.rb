class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to root_path, notice: 'Event was saved'
    else
      flash[:alert] = @event.errors.count
      redirect_to root_path, alert: 'Event was not created.'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @creator = @event.creator
    @event.update(event_params) if current_user == @creator
    if @event.save
      redirect_to @event
    else
      flash[:notice] = 'Not the host'
      render 'edit'
    end
    # raise params.inspect
  end

  def attend
    @event = Event.find(params[:id])
    @event.attendees << current_user
    if @event.save
      redirect_to '/events'
    else
      redirect_to @event
    end
    # raise params.inspect
  end

  def unattend
    @event = Event.find(params[:id])
    @event.attendees.destroy(current_user)
      redirect_to '/events'
    # raise params.inspect
  end

  def destroy
    @event = Event.find(params[:id])
    @creator = @event.creator
    if current_user == @creator
      @event.destroy
      redirect_to root_path
    else
      flash[:notice] = 'Only owner can delete event'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date)
  end
end
