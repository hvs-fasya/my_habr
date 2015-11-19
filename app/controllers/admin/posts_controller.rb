class Admin::PostsController < Admin::BaseController
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(created_at: :desc)
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
    if @post.save
      @post.category_ids = params["post"][:category_ids]
      @post.tag_ids = params["post"][:tag_ids]
      redirect_to [:admin, @post], notice: 'Post has been successfully created.'
    else
      flash.now[:alert] = 'Post creation failed.'
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      if @post.update(post_params)
        @post.category_ids = params["post"][:category_ids]
        @post.tag_ids = params["post"][:tag_ids]
        redirect_to [:admin, @post], notice: 'Post has been successfully updated.'
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
      @post.categories.clear
      @post.tags.clear
      @post.comments.clear
      redirect_to admin_posts_url, notice: 'Post was successfully destroyed.'
    else
      flash.now[:alert] = 'Post has not been destroyed.'
      redirect_to admin_posts_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title, :body, :tags_ids, :category_ids, :user_id)
    end

end
