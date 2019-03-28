class BlogsController < ApplicationController
  before_action :set_user

  layout 'blog'

  def index
    @posts = SearchEngineService.new(@user, params[:query], params[:page]).perform
  end

  def show
    @post = @user.posts.friendly.find(params[:id])
  end

  private

  def set_user
    @user  = User.find_by_subdomain(request.subdomain)
  end
end