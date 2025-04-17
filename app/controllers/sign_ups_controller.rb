class SignUpsController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]

  def create
    @signup = SignUp.new
    @signup.event_attended_id = params[:sign_up][:id]
    @signup.attendee = current_user
    if @signup.save
      flash[:notice] = "You have joined the event!"
    else
      flash[:alert] = "Could not join event!"
    end
    redirect_to event_path(@signup.event_attended)
  end

  def destroy
    @signup = SignUp.find_by event_attended_id: params[:id], attendee: current_user
    @event = @signup.event_attended
    @signup.destroy
    flash[:notice] = "You have left the event"
    redirect_to event_path(@event)
  end
end
