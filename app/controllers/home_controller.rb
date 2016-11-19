class HomeController < ApplicationController
  def index
    @slides = Slide.all
  end

  def prices
    @plans = DancePlan.all
  end
end
