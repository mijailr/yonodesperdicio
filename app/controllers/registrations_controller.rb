class RegistrationsController < Devise::RegistrationsController
  def create
    if verify_recaptcha
      super
    else
      build_resource
      clean_up_passwords(resource)
      flash.now[:alert] = "Hubo un error rellenando los carácteres. Inténtalo de nuevo."
      flash.delete :recaptcha_error
      render :new
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :user_name, :email, :password, :password_confirmation, :zipcode, :city, :province)
  end

  def account_update_params
    params.require(:user).permit(:name, :user_name, :email, :password, :password_confirmation, :current_password, :zipcode, :city, :province, :image)
  end
end
