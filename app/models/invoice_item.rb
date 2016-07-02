class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice, inverse_of: :items
end
