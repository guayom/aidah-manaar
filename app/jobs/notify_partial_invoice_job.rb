class NotifyPartialInvoiceJob < ActiveJob::Base
  queue_as :default

  def perform(invoice)
    AdminMailer.notify_about_partial_invoice(invoice).deliver_later
  end
end
