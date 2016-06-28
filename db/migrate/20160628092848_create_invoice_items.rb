class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.references :invoice, null: false, index: true
      t.string :name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
