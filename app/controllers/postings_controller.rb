class PostingsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_product, only: [:new, :create]
  # before_action :set_posting, only: [:edit, :update, :destroy]

  def index
    @farm = current_user.role
  end

  def new
    @posting = @product.postings.new
  end

  def create
    @posting = @product.postings.new(posting_params)

    if @posting.save
      redirect_to farm_postings_path(current_user), notice: "posting for #{@product.name} created"
    else
      flash.now[:alert] = @posting.errors.full_messages.join(', ')
      render :new
    end
  end

  # def update
  #   if @posting.update(posting_params)
  #     redirect_to product_postings_path(@product), notice: "posting for #{@product.name} updated"
  #   else
  #     flash.now[:alert] = @posting.errors.full_messages.join(', ')
  #     render :edit
  #   end
  # end

  # def destroy
  #   name = @product.name
  #   @posting.destroy
  #   redirect_to product_postings_path(@product), alert: "#{name} deleted"
  # end

  private

  def posting_params
    params.require(:posting).permit(:quantity, :unit, :price_per_unit, :starting_date, :expiration_date)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_posting
    @posting = @product.postings.find(params[:id])
  end

end
