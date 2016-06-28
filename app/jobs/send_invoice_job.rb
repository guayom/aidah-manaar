class SendInvoiceJob < ActiveJob::Base
  queue_as :default

  def perform(invoice)
    StudentMailer.send_invoice(invoice).deliver_later
  end
end
