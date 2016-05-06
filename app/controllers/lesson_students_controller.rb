class LessonStudentsController < ApplicationController
  load_and_authorize_resource

  def create
    respond_to do |format|
      format.js do
        if @lesson_student.save
          render inline: 'calendar.view(); $("#lesson_modal").modal("hide");'
        end
      end
    end
  end

  private

  def resource_params
    params.require(:lesson_student).permit(:lesson_id, :student_id)
  end
end
