class Export::StudentsController < ApplicationController
  load_resource

  def index
    # if admin_signed_in?
      render json: Student.all
    # else
    #   render root_path
    # end
  end
end
