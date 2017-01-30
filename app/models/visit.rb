class Visit < ActiveRecord::Base
  belongs_to :student

  after_initialize do
    if new_record?
      self.timestamp ||= Time.now
    end
  end
end
