class PostsController < ApplicationController
  # before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
      if params[:category_id]
        @category = Category.find(params[:category_id])
        @posts = @category.posts.order(created_at: :desc)
      else
        @posts = Post.all.order(created_at: :desc)
      end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
    @tags = Tag.all
    @categories = Category.all
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @tags = Tag.all
    @categories = Category.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "<h4>Post has been successfully created</h4>".html_safe
      redirect_to @post
    else
      make_alert('Post creation failed')
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        make_notice('Post has been successfully updated')
        redirect_to @post
      else
        make_alert('Post update failed')
        render :edit
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    if @post.destroyed?
      flash[:notice] = "<h4>Post was successfully destroyed.</h4>".html_safe
      redirect_to posts_url
    else
      make_alert('Post has not been destroyed')
      redirect_to posts_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_post
    #   @post = Post.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def make_alert (alert_header)
      flash[:alert] = "<h4>#{alert_header}</h4>"
        if @post.errors.any?
            @post.errors.full_messages.each do |message|
                flash[:alert] += ('</br>'+ message)
          end
        end
        flash[:alert] = flash[:alert].html_safe
    end

    def make_notice (notice_header)
      flash[:notice] = "<h4>#{notice_header}</h4>"
        if @post.errors.any?
            @post.errors.full_messages.each do |message|
                flash[:notice] += '</br>'+ message
          end
        end
        flash[:notice] = flash[:notice].html_safe
    end

end
