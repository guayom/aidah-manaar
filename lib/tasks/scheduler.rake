task :create_invoices => :environment do
  puts 'Creating monthly invoices...'

  Student.find_by(id: 232).create_invoice!
  Invoice.where(student_id: 232).last.send!

  puts 'done.'
end
