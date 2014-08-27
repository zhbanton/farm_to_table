class OrganizationPickupDaysController < ApplicationController

  before_action :authenticate_user!

  def index
    @pickup_days = current_user.role.order_items_by_pickup_date
  end

end
