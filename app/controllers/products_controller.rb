class ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_farm
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = @farm.products.order(:name)
  end

  def show
    @product = Product.find(params[:id])
  end

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

  def update
    if @product.update(product_params)
      redirect_to farm_products_path(@farm), notice: "#{@product.name} updated"
    else
      render :edit
    end
  end

  def destroy
    name = @product.name
    @product.destroy
    redirect_to farm_products_path(@farm), alert: "#{name} deleted"
  end

  private

  def product_params
    params.require(:product).permit(:name, :variety, :image, :description, :organic, :default_price, :default_unit, :non_gmo, :no_spray, :low_spray)
  end

  def set_farm
    @farm = Farm.find(params[:farm_id])
  end

  def set_product
    @product = @farm.products.find(params[:id])
  end

end
