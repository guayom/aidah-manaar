class AddCardInfoToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :method, :integer
    add_column :payments, :payment_system, :integer
  end
end
