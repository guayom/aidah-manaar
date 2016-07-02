class Export::BranchesController < ApplicationController
  load_resource

  def index
    if can?(:export, :data)
      render json: Branch.all
    else
      render root_path
    end
  end
end
