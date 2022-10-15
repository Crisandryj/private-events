class JoinsController < ApplicationController
  def create
    @event= current_user.attended_event(event_params)
    if @event.save
      redirect_to root_path, notice: "You've selected event to attend"
    else
      redirect_to root_path, alert: "did not save"
    end
  end

  private
  def event_params
    params.require(:user).permit(:title)
  end

end
