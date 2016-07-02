class Slide < ActiveRecord::Base
  has_attached_file :image,
                    path: '/slides/:id/:style/:filename',
                    styles: { homepage: '1440x900>' }

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
