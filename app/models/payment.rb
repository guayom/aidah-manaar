class Payment < ActiveRecord::Base
  enum method: { cash: 1, card: 2 }
  enum payment_system: { visa: 1, mastercard: 2 }

  belongs_to :student
  belongs_to :invoice

  scope :accepted, -> { where(accepted: true) }

  scope :pending, -> { where(accepted: false) }

  validates_presence_of :method
  validates_presence_of :invoice, if: :accepted?

  after_save do
    unless invoice.payed
      payed_sum = invoice.payments.accepted.map(&:sum).sum
      if payed_sum >= invoice.total
        invoice.update!(payed: true)
      end

      if invoice.has_discount?
        invoice.update!(payed_with_discount: true)
      end
    end
  end
end
