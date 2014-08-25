class HomeController < ApplicationController

  def index
    @farms = Farm.all.includes(:products, :postings)
  end

end



