class Payment < ActiveRecord::Base
  belongs_to :student
  belongs_to :invoice

  scope :accepted, -> { where(accepted: true) }

  validates_presence_of :invoice, if: :accepted?

  after_save do
    unless invoice.payed
      total_sum = invoice.items.map(&:price).sum
      payed_sum = invoice.payments.accepted.map(&:sum).sum
      if payed_sum >= total_sum
        invoice.update!(payed: true)
      end
    end
  end
end
