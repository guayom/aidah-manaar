class Export::CoursesStudentsController < ApplicationController
  load_resource

  def index
    if can?(:export, :data)
      render json: CourseStudent.all
    else
      render root_path
    end
  end
end
