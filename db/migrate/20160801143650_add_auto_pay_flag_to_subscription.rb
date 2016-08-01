class AddAutoPayFlagToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :automatically_generate_first_payment, :boolean, default: false
  end
end
