class RolesController < ApplicationController
  def update
    # binding.pry
    user = User.find_by(id: role_params[:user_id])
    if user
      if role_params[:admin] == '1'
        user.add_role :admin
      elsif role_params[:poster] == '1'
        user.add_role :poster
      elsif role_params[:admin] == '0'
        user.remove_role :admin
      elsif role_params[:poster] == '0'
        user.remove_role :poster
      end
      redirect_to '/users/admin'
    else
      redirect_to root_path
    end
  end

  private

  def role_params
    params.require(:role).permit(:user_id, 'admin', 'poster')
  end
end
