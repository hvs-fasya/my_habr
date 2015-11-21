class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :verify_owner_or_admin, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
      if params[:category_id]
        @category = Category.find(params[:category_id])
        @posts = @category.posts.order(created_at: :desc).published
      else
        @posts = Post.published.order(created_at: :desc)
      end
  end

  def unpublished_included
    if current_user.admin?
      @posts = Post.all.order(created_at: :desc)
    else
      @posts = Post.order(created_at: :desc).published.concat(current_user.posts)
      @posts.concat(current_user.posts.order(created_at: :desc))
    end
  end

  def unpublished
      if current_user.admin?
        @posts = Post.unpublished.order(created_at: :desc)
      else
        @posts = current_user.posts.unpublished.order(created_at: :desc)
      end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @tags = Tag.all
    @categories = Category.all
  end

  # GET /posts/1/edit
  def edit
    @tags = Tag.all
    @categories = Category.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      @post.category_ids = params["post"][:category_ids]
      @post.tag_ids = params["post"][:tag_ids]
      redirect_to @post, notice: 'Post has been successfully created.'
    else
      flash.now[:alert] = 'Post creation failed.'
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
        if params["post"][:category_ids] 
          @post.category_ids = params["post"][:category_ids]
        end
        if params["post"][:tag_ids]
          @post.tag_ids = params["post"][:tag_ids]
        end
      if @post.update(post_params)
        redirect_to @post, notice: 'Post has been successfully updated.'
      else
        flash.now[:alert] = 'Post update failed.'
        render :edit
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    if @post.destroyed?
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    else
      flash.now[:alert] = 'Post has not been destroyed.'
      redirect_to posts_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title, :body, :tags_ids, :category_ids, :user_id, :published)
    end

    # def verify_owner
    #   unless user_signed_in? && current_user.id == @post.user.id
    #     redirect_to @post, notice: 'У вас нет прав на выполнение этого действия.'
    #   end
    # end

    def verify_owner_or_admin
      unless user_signed_in? && (current_user.id == @post.user.id || current_user.admin?)
        redirect_to @post, notice: 'У вас нет прав на выполнение этого действия.'
      end
    end
end