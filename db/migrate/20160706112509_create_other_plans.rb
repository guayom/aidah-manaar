class CreateOtherPlans < ActiveRecord::Migration
  def change
    create_table :other_plans do |t|
      t.string :name
      t.decimal :price_per_lesson

      t.timestamps null: false
    end
  end
end
