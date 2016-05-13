class AddMainToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :main, :boolean, default: false
  end
end
