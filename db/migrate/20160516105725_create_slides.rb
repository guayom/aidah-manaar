class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end

    add_attachment :slides, :image
    add_column :slides, :image_meta, :text
  end
end
