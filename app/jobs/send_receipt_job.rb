class SendReceiptJob < ActiveJob::Base
  queue_as :default

  def perform(invoice)
    StudentMailer.send_receipt(invoice).deliver_later
  end
end
