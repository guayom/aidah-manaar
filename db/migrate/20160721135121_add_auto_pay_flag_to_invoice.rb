class AddAutoPayFlagToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :should_be_auto_payed, :boolean, default: false
  end
end
