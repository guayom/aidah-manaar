class LessonsController < ApplicationController
  load_and_authorize_resource

  def index
    if student_signed_in?
      @lessons = @lessons.where(branch_id: current_student.branch_id)
    end

    respond_to do |format|
      format.json
    end
  end

  def show
    render layout: false
  end
end
