class Canton < ActiveRecord::Base
  belongs_to :province

  has_many :districts

  validates_presence_of :name

  def to_s
    name
  end
end
