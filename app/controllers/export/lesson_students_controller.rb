class Export::LessonStudentsController < ApplicationController
  load_resource

  def index
    if can?(:export, :data)
      render json: LessonStudent.all
    else
      render root_path
    end
  end
end
