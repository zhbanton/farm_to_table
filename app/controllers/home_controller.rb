class HomeController < ApplicationController

  include CurrentOrder

  before_action :authenticate_user!
  before_action :set_order, only: :index

  def index
    @farms = Farm.all.includes(:products, :postings)
  end

end



