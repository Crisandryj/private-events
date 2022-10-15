class JoinsController < ApplicationController
  def create
    @join= Join.event(event_params)
    if @join.save
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
