class PostingsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_product
  before_action :set_posting, only: [:edit, :update, :destroy]

  def index
    @postings = @product.postings
  end

  def new
    @posting = Posting.new
  end

  def create
    @posting = @product.postings.new(posting_params)

    if @posting.save
      redirect_to product_postings_path(@product), notice: "posting for #{@product.name} created"
    else
      flash.now[:alert] = @posting.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    if @posting.update(posting_params)
      redirect_to product_postings_path(@product), notice: "posting for #{@product.name} updated"
    else
      flash.now[:alert] = @posting.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    name = @posting.name
    @posting.destroy
    redirect_to product_postings_path(@product), alert: "#{name} deleted"
  end

  private

  def posting_params
    params.require(:posting).permit(:quantity, :unit, :price_per_unit, :starting_date, :ending_date)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_posting
    @posting = @product.postings.find(params[:id])
  end

end
