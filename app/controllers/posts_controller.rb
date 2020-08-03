class PostsController < ApplicationController
  before_action :authenticate_account!, except: [:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :save_post_view]
  before_action :can_modify_post, only: [:edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.account_id = current_account.id

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def save_post_view
    # increment view count for post
    @post.increment(:views, 1).save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def can_modify_post
      redirect_back(fallback_location: root_path) and return unless @post.account_id == current_account.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :summary, :body, :active, :category_id)
    end
end
