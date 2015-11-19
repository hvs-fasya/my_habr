class Admin::WelcomeController < Admin::BaseController
  def index
  	@posts_count = Post.count
  	@comments_count = Comment.count
  	@categories_count = Category.count
  	@tags_count = Tag.count
  	@users_count = User.count
  end
end