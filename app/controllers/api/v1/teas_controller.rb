class Api::V1::TeasController < ApplicationController
  def create
    tea = Tea.find_or_create_by!(tea_params)
    render json: TeaSerializer.new(tea), status: 201
  end

  private

  def tea_params
    params.permit(:title, :description, :temperature, :brew_time)
  end

end
