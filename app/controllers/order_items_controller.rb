class OrderItemsController < ApplicationController

  include CurrentOrder

  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]
  respond_to :json, :html

  def index
    @farms = Farm.all.includes(:business_days, :products, :postings)
  end

  def create
    order_item = OrderItem.new(order_item_params)
    order_item.order = @order
    order_item.save
    respond_with(order_item)
  end

  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_item_params)
    respond_with(order_item)
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order_item.destroy
    respond_with(order_item)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:posting_id, :quantity, :pickup_date, :unit, :price_per_unit)
  end

end
