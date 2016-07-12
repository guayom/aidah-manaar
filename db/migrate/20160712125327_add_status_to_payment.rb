class AddStatusToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :accepted, :boolean, default: false
  end
end
