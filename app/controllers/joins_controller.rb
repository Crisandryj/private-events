class JoinsController < ApplicationController
  def new
    @Join = Join.new
  end

  def create
    @attendee = User.attended_events(event_params)
  end



  private
  def event_params
    params.require(:event).permit(:title,:date)
  end

end
