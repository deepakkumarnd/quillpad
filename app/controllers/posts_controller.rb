class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, except: [:index, :new, :create]
  before_action :decrypt_secure_post, only: [:show, :edit]

  # GET /posts
  # GET /posts.json
  def index
    @posts = SearchEngine.search(current_user, params[:query], user_signed_in?, params[:page])
  end

  # GET /posts/1

  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(create_post_params)
    encrypt_secure_post

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post.assign_attributes(update_post_params)
    encrypt_secure_post

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    authorize @post
    @post.publish!
    render :show
  end

  def unpublish
    authorize @post
    @post.unpublish!
    render :show
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_user.posts.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_post_params
      params.require(:post).permit(:title, :content, :kind)
    end

    def update_post_params
      params.require(:post).permit(:title, :content)
    end

    def decrypt_secure_post
      if @post.secure?
        @post = SecurePost.new(current_user, @post).decrypt
      end
    end

    def encrypt_secure_post
      if @post.secure?
        @post = SecurePost.new(current_user, @post).encrypt
      end
    end
end
