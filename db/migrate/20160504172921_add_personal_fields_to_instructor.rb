class AddPersonalFieldsToInstructor < ActiveRecord::Migration
  def change
    change_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.belongs_to :district, index: true
      t.belongs_to :branch, index: true
    end
  end
end
