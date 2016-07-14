class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice, inverse_of: :items

  def has_discount?
    price_with_discount.present?
  end

  def discount
    if has_discount?
      price_with_discount - price
    else
      0
    end
  end
end
