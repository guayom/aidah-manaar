class AddDefaultToSubscriptionStartDate < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :start_date
    rename_column :subscriptions, :end_date, :finished_at
  end
end
