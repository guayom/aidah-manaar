class Video < ActiveRecord::Base
  has_attached_file :file,
                    styles: {
                      mp4: { geometry: '520x390', format: 'mp4' },
                      preview: { format: 'jpg', time: 5 }
                    },
                    default_url: '/videos/:style/missing.png',
                    processors: [:transcoder]
  validates_attachment_content_type :file, content_type: /\Avideo\/.*\Z/

  def url
    result = ''
    result << title + '<br>'.html_safe if title.present?
    result << file.url(:mp4)

    "#{(title + '<br>') if title.present?}#{file.url(:mp4)}".html_safe
  end
end
