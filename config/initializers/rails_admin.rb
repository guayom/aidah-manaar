require Rails.root.join('lib', 'rails_admin', 'attendance.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Attendance)

require Rails.root.join('lib', 'rails_admin', 'payments_report.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::PaymentsReport)

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

    attendance
    payments_report

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

    member :autopay_invoice do
      link_icon 'icon-plus'

      visible do
        [Invoice].include?(bindings[:abstract_model].model) &&
          !bindings[:object].payed?
      end

      controller do
        Proc.new do
          @object.autopay!

          flash[:success] = 'Payment was created and invoice was confirmed.'

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

    # Add the nestable action for configured models
    nestable
  end

  config.model Invoice do
    label "Factura"
    label_plural "Facturas"
    navigation_label 'Facturación'
    weight 1

    list do
      scopes [:all, :partial, :not_confirmed]

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
        label "Pagos a la factura"
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

    show do
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
    label 'Estudiante'
    label_plural 'Estudiantes'
    weight 3
    navigation_label 'Administración'
    object_label_method do
      :label
    end
    configure :student_is_active
    edit do
      exclude_fields :courses_students, :student_is_active
      field :birthdate do
        strftime_format '%Y-%m-%d'
      end
    end
    list do
      scopes [:all, :with_pending_invoices, :active_students, :inactive_students]

      field :student_is_active, :boolean do
        label 'Al día'
      end
      field :full_name do
        label 'Nombre'
        searchable [:first_name, :last_name, :second_last_name]
      end
      field :branch
      field :beginner
      field :email
      field :phone
    end
  end

  config.model Course do
    navigation_label 'Administración'
    label "Curso"
    label_plural "Cursos"
    weight 4

    list do
      field :kind
      field :name
      field :parent_name
      field :level
    end

    edit do
      exclude_fields :children, :self_and_ancestors, :self_and_descendants

      field :full_description, :ck_editor
      field :public_description, :ck_editor
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
      field :start_time do
        strftime_format "%l %P"
      end
      field :instructor
    end
  end

  config.model Branch do
    label "Sede"
    label_plural "Sedes"
    navigation_label 'Administración'
    object_label_method :name
    weight 7
  end

  config.model Instructor do
    label "Instructor"
    label_plural "Instructores"
    navigation_label 'Administración'
    object_label_method :complete_name
    weight 8

    list do
      field :complete_name do
        label 'Nombre'
      end
      field :email
      field :lessons
    end
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

  config.model DancePlan do
    nestable_list true
    navigation_label 'Administración'
    label "Plan"
    label_plural "Planes"
    weight 150
  end

  config.model Testimonial do
    navigation_label 'Administración'
    label "Testimonio"
    label_plural "Testimonios"
  end

  config.model Subscription do
    navigation_label 'Administración'
    label "Suscripción"
    label_plural "Suscripciones"

    edit do
      field :student
      field :dance_plan
      field :finished_at do
        strftime_format '%Y-%m-%d'
      end
    end
  end

  config.model Task do
    navigation_label 'Administración'
    label "Tarea"
    label_plural "Tareas"
    weight 200
  end
  config.model OtherPlan do
    navigation_label 'Administración'
    label 'Otro plan'
    label_plural 'Otros planes'
    weight 151
  end

  config.model Visit do
    edit do
      field :student
      field :timestamp, :datetime do
        strftime_format '%Y-%m-%d %H:%M'
      end
    end
  end
end
