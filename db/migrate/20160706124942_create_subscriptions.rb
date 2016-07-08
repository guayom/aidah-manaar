class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :student
      t.references :dance_plan
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
