class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :author
      t.string :job_title
      t.string :quote

      t.timestamps null: false
    end
  end
end
