class OrdersController < ApplicationController

  include CurrentOrder

  before_action :authenticate_user!
  before_action :set_order, only: :new

  def show
  end

end
