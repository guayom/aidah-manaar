class Export::LessonsController < ApplicationController
  load_resource

  def index
    if can?(:export, :data)
      render json: Lesson.all
    else
      render root_path
    end
  end
end
