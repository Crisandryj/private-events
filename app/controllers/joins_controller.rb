class JoinsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.attended_events(event_params)
  end

  def index
    @joins = Join.all
  end





  private
  def event_params
    params.require(:event).permit(:title,:date)
  end

end
