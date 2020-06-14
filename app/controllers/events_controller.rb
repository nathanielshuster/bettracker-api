class EventsController < ApplicationController
  before_action :authorize, only: [:create, :show, :destroy]

  # CREATE
  def create
    @user = logged_in_user
    @event = Event.create_or_find_by(event_params)
    if @event.save
      @user.events << @event
      render json: { message: "Success" }, status: :ok
    else
      render json: { error: "Error" }, status: 400
    end
  end

  # SHOW
  def show
    @user = logged_in_user
    @events = @user.events
    if @events
      render json: @events, status: 200
    else
      render json: { error: "Error" }, status: 400
    end
  end

  #DESTROY
  def destroy
    @user = logged_in_user
    @event = Event.find_by(event_params)
    if @user && @event
      @user.events.delete(@event)
      render json: { message: "Success" }, status: :ok
    else
      render json: { error: "Error" }, status: 400
    end
  end

  private

  def event_params
    params.require(:event).permit(:sport, :sport_nice, :home_team, :away_team, :unix_time, sites_attributes: [:site_name, :site_nice, :home_line, :away_line])
  end

end
