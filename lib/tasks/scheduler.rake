task :create_invoices => :environment do
  puts 'Creating monthly invoices...'

  if Task.need?('create_invoices')
    Student.find_by(id: 232).create_invoice!
    Invoice.where(student_id: 232).last.send!
    Task.finish!('create_invoices')
  end

  puts 'done.'
end
