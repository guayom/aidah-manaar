class AddSecondLastNameToStudent < ActiveRecord::Migration
  def change
    add_column :students, :second_last_name, :string
  end
end
