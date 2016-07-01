class ConfirmRegistrationJob < ActiveJob::Base
  queue_as :default

  def perform(student, password, params = {})
    if params[:beginner]
      StudentMailer.confirm_registration(student, password, beginner: true).deliver_later
    else
      StudentMailer.confirm_registration(student, password).deliver_later
    end
  end
end
