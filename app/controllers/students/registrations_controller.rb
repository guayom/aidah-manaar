class Students::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  def create
    super

    if resource.persisted?
      if resource.beginner?
        Course.base.students << resource

        set_flash_message!(:notice, 'signed_up_and_basic_course')
      else
        ConfirmRegistrationJob.perform_later(resource)
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
             keys: [:first_name, :last_name, :id_number, :birthdate, :phone, :branch_id, :beginner])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.
      permit(:account_update,
             keys: [:first_name, :last_name, :id_number, :birthdate, :phone, :branch_id])
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
