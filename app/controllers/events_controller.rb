class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    if @event.save
      flash[:notice] = "Post created!"
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "Post could not be created!"
      render :new, status: :unprocessable_entity
    end
  end

  private
    def event_params
      params.expect(event: [ :name, :location, :date ])
    end
end
