class CampersController < ApplicationController
  def index
    campers = Camper.all
    render json: campers, each_serializer: AllCamperSerializer
  end

  def show
    camper = Camper.find_by(id: params[:id])
    if camper
      render json: camper
    else
      render json: { error: "Camper not found" }, status: :not_found
    end
  end

  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  end

  private

  def camper_params
    params.permit(:name, :age)
  end
end
