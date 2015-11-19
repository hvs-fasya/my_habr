class Admin::CommentsController < Admin::BaseController
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  # before_action :verify_owner, only: [:edit, :update, :destroy]
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    # @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    # @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    if @comment.save
      # flash[:notice] = ("<h4></h4>").html_safe
      redirect_to [:admin, @post], notice: 'Comment was successfully created.'
    else
      # make_alert ()
      redirect_to [:admin, @post], alert: 'Comment creation failed.'
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    # @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      @post = Post.find(params[:post_id])
      # make_alert()
      redirect_to [:admin, @post], notice: 'Comment was successfully updated.'
    else
      render :edit, alert: 'Comment update failed.'
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    # @comment = Comment.find(params[:id])
    # @post = @comment.post
    @comment.destroy
    redirect_to [:admin, @comment.post], notice: 'Comment has been successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def comment_params
      params.require(:comment).permit(:body,:post_id,:user_id)
    end
    # def verify_owner
    #   unless user_signed_in? && current_user.id == @comment.user.id
    #     redirect_to @comment.post, notice: 'У вас нет прав на выполнение этого действия.'
    #   end
    # end
    # def make_alert (alert_header)
    #   flash[:alert] = "<h4>#{alert_header}</h4>"
    #     if @comment.errors.any?
    #         @comment.errors.full_messages.each do |message|
    #             flash[:alert] += '</br>'+ message
    #       end
    #     end
    #     flash[:alert] = flash[:alert].html_safe
    # end
end
