class AddSentToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :sent, :boolean, default: false
  end
end
