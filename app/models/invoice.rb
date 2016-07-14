class Invoice < ActiveRecord::Base

  belongs_to :student

  has_many :items, class_name: 'InvoiceItem', inverse_of: :invoice
  accepts_nested_attributes_for :items, allow_destroy: true

  has_many :payments

  def send!
    SendInvoiceJob.perform_later(self)

    update!(sent: true)
  end

  def confirm!
    SendReceiptJob.perform_later(self)

    update_attributes!(confirmed: true)
  end

  def sum
    items.map(&:price).sum
  end
end
