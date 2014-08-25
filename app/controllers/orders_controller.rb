class OrdersController < ApplicationController

  include CurrentOrder

  before_action :set_order, only: :new

  def new
  end

end
