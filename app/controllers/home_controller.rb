class HomeController < ApplicationController
  def index
  end

  def prices
    @plans = DancePlan.all
  end
end
