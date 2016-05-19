RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  config.authorize_with :cancan, AdminAbility

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  class RailsAdmin::Config::Fields::Types::Bootsy < RailsAdmin::Config::Fields::Types::Text
    RailsAdmin::Config::Fields::Types::register(self)

    register_instance_option :partial do
      :form_bootsy
    end
  end

  class RailsAdmin::Config::Fields::Types::Date
    register_instance_option :date_format do
      :default
    end
  end

  config.actions do
    dashboard

    index
    new
    export
    # history_index
    bulk_delete

    show
    edit
    delete
    # history_show
    show_in_app
  end
  config.model Student do
    weight 1
    object_label_method do
      :label
    end
    edit do
      exclude_fields :courses_students
    end
  end

  config.model Course do
    weight 2

    list do
      field :name
      field :parent_name
      field :level
    end

    edit do
      exclude_fields :children, :self_and_ancestors, :self_and_descendants

      field :full_description, :bootsy
      field :public_description, :bootsy
    end
  end

  config.model Lesson do
    weight 3
    list do
      field :id
      field :branch
      field :course
      field :day_of_week
      field :start_time
      field :instructor
    end
  end
end
