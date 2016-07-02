class Payment < ActiveRecord::Base
  belongs_to :student
  belongs_to :invoice

  after_create do
    total_sum = invoice.items.map(&:price).sum
    payed_sum = invoice.payments.map(&:sum).sum
    if payed_sum >= total_sum
      invoice.update!(payed: true)
    end
  end
end
