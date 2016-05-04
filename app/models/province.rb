class Province < ActiveRecord::Base
  has_many :cantons

  validates_presence_of :name

  def to_s
    name
  end
end
