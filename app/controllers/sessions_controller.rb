class SessionsController < Devise::SessionsController

  include CurrentOrder

  before_filter :destroy_order, only: :destroy

  private

  def destroy_order
    if current_user.role == 'Farm'
      set_order
      @order.destroy
    end
  end

end
