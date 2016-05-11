class AddIdNumberToStudent < ActiveRecord::Migration
  def change
    add_column :students, :id_number, :string
    add_index :students, :id_number, unique: true
  end
end
