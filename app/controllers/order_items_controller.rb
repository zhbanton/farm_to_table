class OrderItemsController < ApplicationController

  include CurrentOrder

  before_action :authenticate_user!
  before_action :set_order, only: :create
  respond_to :html, :json

  def create
    order_item = OrderItem.new(order_item_params)
    order_item.order = @order
    order_item.save
    render json: order_item
  end

  private

  def order_item_params
    params.require(:order_item).permit(:posting_id, :quantity, :pickup_date, :cost)
  end

end
