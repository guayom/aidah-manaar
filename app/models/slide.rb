class Slide < ActiveRecord::Base
  has_attached_file :image,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }, presence: true

  rails_admin do
    edit do
      exclude_fields :image_meta
    end
  end

  default_scope do
    order(created_at: :desc)
  end
end
