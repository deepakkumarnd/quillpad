class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def publish?
    !(@post.secure? || @post.published?)
  end

  def unpublish?
    !@post.secure? && @post.published?
  end
end
