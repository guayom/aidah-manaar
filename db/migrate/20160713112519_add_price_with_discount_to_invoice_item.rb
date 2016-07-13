class AddPriceWithDiscountToInvoiceItem < ActiveRecord::Migration
  def change
    add_column :invoice_items, :price_with_discount, :decimal
  end
end
