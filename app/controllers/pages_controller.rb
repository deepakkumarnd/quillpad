class PagesController < ApplicationController
  layout 'landing'

  def index
    if user_signed_in?
      redirect_to posts_path
    end
  end

  # TODO: Remove this, about moved to blogs#about
  def show
    @about = if user_signed_in?
      current_user.about
    else
      I18n.t(:about)
    end
  end
end