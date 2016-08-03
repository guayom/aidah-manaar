class ChangeInvoiceSequenceNumber2365 < ActiveRecord::Migration
  def change
    execute <<-SQL
ALTER SEQUENCE invoices_id_seq RESTART WITH 2365;
    SQL
  end
end
