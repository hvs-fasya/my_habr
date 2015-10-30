class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end
	def show
		@category = Category.find(params[:id])
	end
	def new
    	@category = Category.new
  	end
	def edit
		@category = Category.find(params[:id])
	end
	def create
	    @category = Category.new(category_params)
	    if @category.save
	        redirect_to @category, notice: 'Ctegory was successfully created.'
	    else
	        render :new
	    end
	end
	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			redirect_to @category, notice: 'Ctegory was successfully updated.'
		else
			render :edit
		end
	end
	def destroy
		@category = Category.find(params[:id])
	    @category.destroy
	      redirect_to categories_url, notice: 'Category was successfully destroyed.'
	  end


	private

	 def category_params
      params.require(:category).permit(:title)
    end

end