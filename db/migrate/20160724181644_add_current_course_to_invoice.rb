class AddCurrentCourseToInvoice < ActiveRecord::Migration
  def change
    change_table :invoices do |t|
      t.belongs_to :course
    end
  end
end
