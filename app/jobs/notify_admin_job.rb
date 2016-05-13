class NotifyAdminJob < ActiveJob::Base
  queue_as :default

  def perform(student)
    AdminMailer.notify_about_registration(student).deliver_later
  end
end
