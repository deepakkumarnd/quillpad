class PagesController < ApplicationController
  layout 'landing'

  def index
    redirect_to root_url(subdomain: current_user.subdomain) if user_signed_in?
  end

  def show
  end
end