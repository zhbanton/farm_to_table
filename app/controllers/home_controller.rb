class HomeController < ApplicationController

  def index
    @farms = Farm.all
  end

end



