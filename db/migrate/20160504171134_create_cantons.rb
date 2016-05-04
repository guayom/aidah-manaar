class CreateCantons < ActiveRecord::Migration
  def change
    create_table :cantons do |t|
      t.string :name
      t.belongs_to :province, index: true

      t.timestamps null: false
    end
  end
end
