class Admin::UsersController < Admin::BaseController

	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
		if @user.update(user_params)
        redirect_to [:admin, @user], notice: 'User has been successfully updated.'
      else
        flash.now[:alert] = 'User update failed.'
        render :edit
      end
	end

	def destroy
		@user.destroy
	    if @user.destroyed?
	      redirect_to admin_users_url, notice: 'User was successfully destroyed.'
	    else
	      flash.now[:alert] = 'User has not been destroyed.'
	      redirect_to admin_users_url
	    end
	end

	private

	def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:email,:admin)
    end
end
