class ConfirmRegistrationJob < ActiveJob::Base
  queue_as :default

  def perform(student)
    StudentMailer.confirm_registration(student).deliver_later
  end
end
