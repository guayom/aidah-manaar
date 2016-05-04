class Course < ActiveRecord::Base
  has_closure_tree
  has_many :lessons

  rails_admin do
    list do
      field :name
      field :parent_name
      field :level
      field :quota
    end

    edit do
      exclude_fields :children, :self_and_ancestors, :self_and_descendants
    end
  end

  def parent_name
    parent.try(:name)
  end

  def to_builder
    JBuilder.new do |course|
      course.id id
    end
  end
end
