class CoursesController < ApplicationController
  load_and_authorize_resource except: [:index], find_by: :slug

  def index
  end

  def show
  end
end
