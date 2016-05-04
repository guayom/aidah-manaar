class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.belongs_to :branch, index: true
      t.belongs_to :course, index: true
      t.belongs_to :instructor, index: true
      t.decimal :length, precision: 1

      t.timestamps null: false
    end
  end
end
