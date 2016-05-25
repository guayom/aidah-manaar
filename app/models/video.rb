class Video < ActiveRecord::Base
  has_attached_file :file,
                    styles: {
                      mp4: { geometry: '520x390', format: 'mp4' },
                      preview: { format: 'jpg', time: 5 }
                    },
                    default_url: '/videos/:style/missing.png',
                    processors: [:transcoder]
  validates_attachment_content_type :file, content_type: /\Avideo\/.*\Z/

  rails_admin do
    edit do
      field :file do
        partial 'video_uploader_viewer'
      end
    end
  end
end
