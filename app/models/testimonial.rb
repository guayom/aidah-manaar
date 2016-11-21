class Testimonial < ActiveRecord::Base
  has_attached_file :avatar, path: '/testimonials/:id/:style/:filename', styles: { medium: "240x240>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
