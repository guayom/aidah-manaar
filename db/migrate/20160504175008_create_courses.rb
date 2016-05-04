class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :level
      t.integer :quota

      t.string :ancestry, index: true

      t.timestamps null: false
    end
  end
end
