class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :student
      t.datetime :time

      t.timestamps null: false
    end
  end
end
