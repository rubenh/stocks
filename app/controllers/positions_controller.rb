class PositionsController < ApplicationController

  def index
    @positions = Position.all
    render json: @positions, status: 200
  end

  def create
    @position = Position.new(position_params)
    if @position.save
      render json: @position, status: :created, location: @position
    else
      binding.pry
      render json: @position.errors, status: 422
    end
  end

  private

  def position_params
    params.require(:position).permit(:symbol, :quantity, :price, :commission)
  end

end
