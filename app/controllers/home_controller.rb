class HomeController < ApplicationController
  def index
    @slides = Slide.all
    @instructors = Instructor.all
    @testimonials = Testimonial.all
  end

  def prices
    @plans = DancePlan.all.sort_by &:position
  end
end
