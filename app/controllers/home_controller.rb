class HomeController < ApplicationController

  include CurrentOrder

  def index
    if user_signed_in?
      if current_user.role_type == 'Farm'
        render 'farms/index'
      elsif current_user.role_type == 'Organization'
        set_order
        @farms = Farm.all.includes(:products, :postings)
        render 'order_items/index'
      end
    end
  end

end



