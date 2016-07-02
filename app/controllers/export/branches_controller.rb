class Export::BranchesController < ApplicationController
  load_resource

  def index
    # if admin_signed_in?
    render json: Branch.all
    # else
    #   render root_path
    # end
  end
end
