class AddAttachmentAvatarToTestimonials < ActiveRecord::Migration
  def self.up
    change_table :testimonials do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :testimonials, :avatar
  end
end
