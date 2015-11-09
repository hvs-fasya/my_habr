class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:notice] = ("<h4>Comment was successfully created.</h4>").html_safe
      redirect_to @post
    else
      make_alert ('Comment creation failed.')
      redirect_to @post
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      make_alert('Comment was successfully updated.')
      redirect_to @comment
    else
      render :edit
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body,:post_id)
    end

    def make_alert (alert_header)
      flash[:alert] = "<h4>#{alert_header}</h4>"
        if @comment.errors.any?
            @comment.errors.full_messages.each do |message|
                flash[:alert] += '</br>'+ message
          end
        end
        flash[:alert] = flash[:alert].html_safe
    end
end
