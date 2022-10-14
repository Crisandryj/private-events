class JoinsController < ApplicationController
  def new
    @Join = Join.new
  end

  def create
    @attended_event = User.attended_events(event_params)
    if @attended_event.save
      redirect_to root_path, notice: "You've selected event to attend"
    else
      redirect_to root_path, alert: "did not save"
    end
  end

  private
  def event_params
    params.require(:user).permit(:title,:date)
  end

end
