class ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_farm

  def new
    @product = Product.new
  end

  def create
    @product = @farm.products.new(product_params)

    if @product.save
      redirect_to farm_products_path(@farm), notice: "#{@product.name} created"
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :variety, :description, :organic, :non_gmo, :no_spray, :low_spray)
  end

  def set_farm
    @farm = Farm.find(params[:farm_id])
  end

end
