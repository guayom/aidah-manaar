class Export::CoursesController < ApplicationController
  load_resource

  def index
    if can?(:export, :data)
      render json: Course.all
    else
      render root_path
    end
  end
end
