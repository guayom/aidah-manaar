class Students::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  def create
    password = Devise.friendly_token.first(8)

    p = sign_up_params
    p['password'] = password

    build_resource(p)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end

    # super ^^^

    if resource.persisted?
      if resource.beginner?
        ConfirmRegistrationJob.perform_later(resource, password, beginner: true)
        Course.base.students << resource

        set_flash_message!(:notice, 'signed_up_and_basic_course')
      else
        ConfirmRegistrationJob.perform_later(resource, password)
        NotifyAdminJob.perform_later(resource)

        flash[:notice] = nil
      end
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.
      permit(:sign_up,
             keys: [:first_name, :last_name, :second_last_name, :id_number, :birthdate, :phone,
                    :branch_id, :beginner])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.
      permit(:account_update,
             keys: [:first_name, :last_name, :second_last_name, :id_number, :birthdate, :phone,
                    :branch_id])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def after_sign_in_path_for(resource)
    flash[:alert] = nil

    select_schedule_path
  end
end
