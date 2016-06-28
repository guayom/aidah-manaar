class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :student
      t.references :invoice
      t.decimal :sum
      t.string :comment

      t.timestamps null: false
    end
  end
end
