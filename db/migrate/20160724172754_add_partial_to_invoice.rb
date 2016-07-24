class AddPartialToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :partial, :boolean, default: false
  end
end
