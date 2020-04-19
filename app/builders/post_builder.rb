# frozen_string_literal: true

# Builder class for creating or updating a Post
class PostBuilder
  def self.build(user, params, post = nil)
    new(user, params).build(post)
  end

  def initialize(user, params)
    @user = user
    @params = params
  end

  def build(post = nil)
    @post =
      if post.nil?
        @user.posts.new(@params)
      else
        post.assign_attributes(@params)
        post
      end

    build_secure_post! if @post.secure?
    @post
  end

  private

  def build_secure_post!
    @post = SecurePost.new(@user, @post).encrypt
  end
end
