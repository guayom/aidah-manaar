class CourseStudentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @course_student.save
      redirect_to :back, notice: "You are successfully enrolled for #{@course_student.course.name}."
    else
      redirect_to :back, alert: 'Something bad happened. Please, contact administrator.'
    end
  end

  private

  def resource_params
    params.require(:course_student).permit(:course_id, :student_id)
  end
end
