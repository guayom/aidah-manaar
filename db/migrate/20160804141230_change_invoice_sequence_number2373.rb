class ChangeInvoiceSequenceNumber2373 < ActiveRecord::Migration
  def change
    execute <<-SQL
ALTER SEQUENCE invoices_id_seq RESTART WITH 2373;
    SQL
  end
end
