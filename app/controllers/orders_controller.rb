class OrdersController < ApplicationController

  include CurrentOrder

  before_action :authenticate_user!
  before_action :set_order, only: [:new, :update]

  def index
  end

  def show
  end

  def update
    if @order.update(is_completed: true)
      redirect_to root_path, notice: "Your order was placed"
      session[:order_id] = nil
    else
      render :new
    end
  end

end
