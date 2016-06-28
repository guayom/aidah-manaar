class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.boolean :payed, default: false
      t.references :student
      t.text :description

      t.timestamps null: false
    end
  end
end
