class CoursesController < ApplicationController
  load_and_authorize_resource except: [:index]

  def index
  end
end
