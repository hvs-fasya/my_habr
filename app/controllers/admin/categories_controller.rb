class Admin::CategoriesController < Admin::BaseController

	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.all
	end

	def show
		@posts = @category.posts
	end

	def new
    	@category = Category.new
  	end

	def edit
	end

	def create
	    @category = Category.new(category_params)
		if @category.save
		    redirect_to [:admin, @category], notice: 'Category has been successfully created.'
		else
		    flash.now[:alert] = 'Category creation failed.'
		    render :new
		end
	end

	def update
		if @category.update(category_params)
        redirect_to [:admin, @category], notice: 'Category has been successfully updated.'
      else
        flash.now[:alert] = 'Category update failed.'
        render :edit
      end
	end

	def destroy
	    @category.destroy
	    if @category.destroyed?
	      @category.posts.clear
	      redirect_to admin_categories_url, notice: 'Category was successfully destroyed.'
	    else
	      flash.now[:alert] = 'Category has not been destroyed.'
	      redirect_to admin_categories_url
	    end
	  end

	private

	 def category_params
      params.require(:category).permit(:title)
    end

	def set_category
      @category = Category.find(params[:id])
    end

end