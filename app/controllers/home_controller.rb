class HomeController < ApplicationController

  include CurrentOrder

  def index
    if user_signed_in?
      if current_user.role_type == 'Farm'
        @pickup_days = current_user.role.order_items_by_pickup_date
        render "farm_pickup_days/index"
      elsif current_user.role_type == 'Organization'
        set_order
        @farms = Farm.all.includes(:products, :postings)
        render 'order_items/index'
      end
    end
  end

end



