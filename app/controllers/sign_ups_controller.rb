class SignUpsController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]

  def create
    @signup = SignUp.new
    @signup.event_attended_id = params[:sign_up][:event_attended_id]
    @signup.attendee = current_user
    if @signup.save
      flash[:notice] = "You have joined the event!"
    else
      flash[:alert] = "Could not join event!"
    end
    redirect_to event_path(@signup.event_attended)
  end
end
