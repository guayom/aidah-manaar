class ConfirmScheduleEnrollmentJob < ActiveJob::Base
  queue_as :default

  def perform(student)
    StudentMailer.confirm_schedule_enrollment(student).deliver_later
  end
end
