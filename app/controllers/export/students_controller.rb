class Export::StudentsController < ApplicationController
  load_resource

  def index
    if can?(:export, :data)
      render json: Student.all
    else
      render root_path
    end
  end
end
