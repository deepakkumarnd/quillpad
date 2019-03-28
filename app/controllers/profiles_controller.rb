class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to edit_profiles_path, notice: 'Updateed successfully'
    else
      redirect_to edit_profiles_path, alert: 'Failed to update'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :subdomain, :about)
    end
end
