class ConfirmScheduleEnrollmentJob < ActiveJob::Base
  queue_as :default

  def perform(student, lessons)
    StudentMailer.confirm_schedule_enrollment(student, lessons).deliver_later
  end
end
