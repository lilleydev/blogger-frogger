class RegistrationsController < Devise::RegistrationsController
  after_action :assign_role, only: [:create]

  private

  def assign_role
    current_user.add_role :poster
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
