class FarmsController < ApplicationController

  respond_to :json

  def default_serializer_options
    {root: false}
  end

  def index
  end

  def show
    farm = Farm.find(params[:id])
    respond_with farm
  end

end
