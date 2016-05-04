class District < ActiveRecord::Base
  belongs_to :canton

  validates_presence_of :name

  def to_s
    name
  end
end
