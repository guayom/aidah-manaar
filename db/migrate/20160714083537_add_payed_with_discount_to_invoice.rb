class AddPayedWithDiscountToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :payed_with_discount, :boolean, default: false
  end
end
