class Export::InstructorsController < ApplicationController
  load_resource

  def index
    if can?(:export, :data)
      render json: Instructor.all
    else
      render root_path
    end
  end
end
