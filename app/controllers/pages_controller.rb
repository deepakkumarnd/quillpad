class PagesController < ApplicationController
  layout 'landing'

  def index
    if user_signed_in? && current_user.subdomain.present?
      redirect_to root_url(subdomain: current_user.subdomain)
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