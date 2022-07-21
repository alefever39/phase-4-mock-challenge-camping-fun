class SignupsController < ApplicationController
  def create
    signup = Signup.create!(signup_params)
    activity = Activity.find_by(id: params[:activity_id])
    render json: activity, status: :created
  end

  private

  def signup_params
    params.permit(:time, :camper_id, :activity_id)
  end
end
