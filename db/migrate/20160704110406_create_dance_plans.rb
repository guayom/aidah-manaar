class CreateDancePlans < ActiveRecord::Migration
  def change
    create_table :dance_plans do |t|
      t.string :name
      t.integer :lessons_per_week
      t.decimal :price
      t.decimal :price_with_discount
      t.decimal :tuition
      t.decimal :leveling

      t.timestamps null: false
    end
  end
end
