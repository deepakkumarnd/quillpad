class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.new(comments_params)
    @comment.save
    ActionCable.server.broadcast(@post.id, content: {
      action: 'add',
      id: @comment.id,
      post_id: @post.slug,
      content: @comment.content,
      created_at: @comment.created_at
    })

    render json: { status: 'ok' }
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    status_code = @comment.destroy ? 200 : 400
    ActionCable.server.broadcast(@post.id, content: { action: 'remove', comment_id: @comment.id })
    render json: { status: 'ok' }
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :commented_by, :commentor_id)
  end

  def set_post
    @post = current_user.posts.find_by_slug(params[:post_id])
  end
end