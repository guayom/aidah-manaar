class AddConfirmedToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :confirmed, :boolean, default: false
  end
end
