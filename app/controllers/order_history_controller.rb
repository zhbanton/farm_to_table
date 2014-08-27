class OrderHistoryController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = current_user.role.orders.order(:created_at)
  end

end
