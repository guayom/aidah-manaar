class AddDefaultToInvoiceItem < ActiveRecord::Migration
  def change
    change_column_null :invoice_items, :price, false, 0
  end
end
