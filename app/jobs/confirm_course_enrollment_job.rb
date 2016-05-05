class ConfirmCourseEnrollmentJob < ActiveJob::Base
  queue_as :default

  def perform(student, course)
    StudentMailer.confirm_course_enrollment(student, course).deliver_later
  end
end
