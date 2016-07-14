require Rails.root.join('lib', 'rails_admin', 'create_invoices.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::CreateInvoices)

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

  class RailsAdmin::Config::Fields::Types::Time
    def parse_value(value)
      parent_value = super(value)
      return unless parent_value

      parent_value.in_time_zone
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

    create_invoices

    member :send_invoice do
      link_icon 'icon-envelope'

      visible do
        [Invoice].include?(bindings[:abstract_model].model) # &&
          # !bindings[:object].try(:sent)
      end

      controller do
        Proc.new do
          @object.send!

          flash[:success] = "#{@model_config.label} was sent to student."

          redirect_to back_or_index
        end
      end
    end

    member :confirm_invoice do
      link_icon 'icon-check'

      visible do
        [Invoice].include?(bindings[:abstract_model].model) &&
          bindings[:object].payed? && !bindings[:object].confirmed?
      end

      controller do
        Proc.new do
          @object.confirm!

          flash[:success] = 'Invoice is confirmed.'

          redirect_to back_or_index
        end
      end
    end

    member :accept_payment do
      link_icon 'icon-check'
      register_instance_option :pjax? do
        false
      end

      visible do
        [Payment].include?(bindings[:abstract_model].model) &&
          !bindings[:object].try(:accepted?)
      end

      controller do
        Proc.new do
          if @object.update_attributes(accepted: true)
            flash[:success] = 'Payment is confirmed.'
          else
            flash[:error] = 'Payment was not accepted. Check if it is correctly linked to invoice.'
          end

          redirect_to back_or_index
        end
      end
    end
  end

  config.model Invoice do
    label "Factura"
    label_plural "Facturas"
    navigation_label 'Facturación'
    weight 1

    list do
      field :id
      field :payed
      field :confirmed
      field :payments_for_invoice do
        pretty_value do
          path = bindings[:view].index_path(
            model_name: 'payment',
            f: { invoice: { rand(1000000) => { o: 'is', v: bindings[:object].id } } }
          )
          "<a href=#{path}>Payments</a>".html_safe
        end
      end
      field :student
      field :created_at
    end
  end

  config.model Payment do
    label 'Recibo'
    label_plural 'Recibos'
    navigation_label 'Facturación'
    weight 2

    list do
      scopes [:all, :pending]

      field :id
      field :accepted
      field :student
      field :invoice
      field :sum
      field :comment
      field :created_at
    end
  end

  config.model Student do
    label "Estudiante"
    label_plural "Estudiantes"
    weight 3
    navigation_label 'Administración'
    object_label_method do
      :label
    end
    edit do
      exclude_fields :courses_students
    end
    list do
      scopes [:all, :with_pending_invoices]

      field :first_name
      field :last_name
      field :second_last_name
      field :branch_id
      field :beginner
    end
  end

  config.model Course do
    navigation_label 'Administración'
    label "Curso"
    label_plural "Cursos"
    weight 4

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

  config.model Requirement do
    label "Requerimiento"
    label_plural "Requerimientos"
    navigation_label 'Administración'
    weight 5
  end

  config.model Lesson do
    configure :start_time, :time
    configure :end_time, :time
    weight 6
    navigation_label 'Administración'
    label "Lección"
    label_plural "Lecciones"

    list do
      field :id
      field :branch
      field :course
      field :day_of_week
      field :start_time
      field :instructor
    end
  end

  config.model Branch do
    label "Sede"
    label_plural "Sedes"
    navigation_label 'Administración'
    weight 7
  end

  config.model Instructor do
    label "Instructor"
    label_plural "Instructores"
    navigation_label 'Administración'
    weight 8
  end

  config.model Admin do
    label "Administrador"
    label_plural "Administradores"
    navigation_label 'Administración'
    weight 9
  end

  config.model Slide do
    navigation_label 'Contenido'
    weight 10
  end

  config.model BranchInstructor do
    navigation_label 'Desarrollo'
    weight 11
  end
  config.model Province do
    navigation_label 'Desarrollo'
    weight 12
  end
  config.model Canton do
    navigation_label 'Desarrollo'
    weight 13
  end
  config.model District do
    navigation_label 'Desarrollo'
    weight 14
  end
  config.model InvoiceItem do
    navigation_label 'Desarrollo'
    weight 15
  end
  config.model LessonStudent do
    navigation_label 'Desarrollo'
    weight 16
  end
  config.model District do
    navigation_label 'Desarrollo'
    weight 17
  end
  config.model Video do
    navigation_label 'Desarrollo'
    weight 18
  end
  config.model CourseStudent do
    navigation_label 'Desarrollo'
    weight 18
  end

  config.model Ckeditor::Asset do
    navigation_label 'Contenido'
    weight 200
  end
  config.model Ckeditor::AttachmentFile do
    navigation_label 'Contenido'
    weight 200
  end
  config.model Ckeditor::Picture do
    navigation_label 'Contenido'
    weight 200
  end
end
