class LessonStudentsController < ApplicationController
  load_and_authorize_resource

  def create
    respond_to do |format|
      format.js do
        if @lesson_student.save
          render inline: 'alert("You are successfully enrolled!"); $("#lesson_modal").modal("hide");'
        else
          render inline: 'alert("Something bad happened! Please contact administrator.");'
        end
      end
    end
  end

  private

  def resource_params
    params.require(:lesson_student).permit(:lesson_id, :student_id)
  end
end
