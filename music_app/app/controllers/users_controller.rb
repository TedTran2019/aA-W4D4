class UsersController < ApplicationController
	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			login!(@user)
			redirect_to user_url(@user)
		else
			flash.now[:errors] = @user.errors.full_messages
			render :new
		end
	end

	# Can only see own page!
	def show
		@user = current_user
		if @user
			render :show
		else
			flash[:errors] = "You are not logged in!"
			redirect_to new_user_url
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end
end
