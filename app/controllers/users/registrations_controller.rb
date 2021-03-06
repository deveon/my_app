class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
   def create
    @user = User.new(user_params)
    if @user.save
    sign_in @user
      redirect_to static_pages_home_path
    else
      render 'new'
    end
   end

  # GET /resource/edit
   def edit
    @user = current_user
   end

  # PUT /resource
   def update
    current_user.update_without_password(user_params)
    sign_in(current_user, :bypass => true)
    flash.notice = "Profile successfully uptaded"
    respond_with current_user
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :fullname)
  end

  def log_in_as (user)
    session[:user_id] = user.id
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
