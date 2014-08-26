module CurrentOrder

  extend ActiveSupport::Concern

  private

  def set_order
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    @order = Order.create(organization: current_user.role, is_completed: false)
    session[:order_id] = @order.id
  end

end
