class HomeController < ApplicationController

  def index
    @farms = Farm.all.includes(:business_days, :products, :postings)
  end

end



