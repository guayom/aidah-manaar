class LessonsController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.json
    end
  end

  def show
    render layout: false
  end
end
