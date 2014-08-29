class OrderHistoryController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = current_user.role.orders.where(is_completed: true).order(:created_at)
  end

end
