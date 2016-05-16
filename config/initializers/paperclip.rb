if Rails.env.development?
  Paperclip::Attachment.default_options.merge!(
    url: 'http://localhost:3000/system/:class/:attachment/:id_partition/:style/:filename')
end
