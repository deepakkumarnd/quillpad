class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
    @user.social_medias.build
  end

  def update
    if current_user.update(user_params)
      redirect_to edit_profiles_path, notice: 'Updateed successfully'
    else
      redirect_to edit_profiles_path, alert: 'Failed to update'
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(
            :name,
            :subdomain,
            :body,
            :about,
            social_medias_attributes: %i[name link _destroy id]
          )
  end
end
