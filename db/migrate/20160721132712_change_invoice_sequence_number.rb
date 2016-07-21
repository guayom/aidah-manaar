class ChangeInvoiceSequenceNumber < ActiveRecord::Migration
  def up
    execute <<-SQL
ALTER SEQUENCE invoices_id_seq RESTART WITH 2306;
    SQL
  end
end
