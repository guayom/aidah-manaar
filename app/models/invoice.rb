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

  def has_discount?
    payed_with_discount? ||
      ((created_at < created_at.beginning_of_month.days_since(10)) &&
        (Date.today < created_at.beginning_of_month.days_since(10)) &&
        items.find_all { |i| i.has_discount? }.any?)
  end

  def discount
    items.find_all { |i| i.has_discount? }.map { |i| i.discount }.sum
  end

  def total
    if payed_with_discount? || has_discount?
      items.map(&:price).sum - discount.abs
    else
      items.map(&:price).sum
    end
  end

  def total_payed
    payments.map(&:sum).sum
  end
end
