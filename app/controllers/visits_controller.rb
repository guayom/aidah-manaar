class VisitsController < ApplicationController
  def track_visit
    if admin_signed_in?
      Visit.create!(student_id: params[:student_id], timestamp: Time.now)
      redirect_to rails_admin.attendance_path, notice: 'Information about visit was saved.'
    end
  end
end
