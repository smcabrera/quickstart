class UsersController < ApplicationController
  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      render "devise/registrations/edit"
    end
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
