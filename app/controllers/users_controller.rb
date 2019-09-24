class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :correct_user, only: [:edit,:update]

	def top
	end
	def index
		@users = User.all
		@user = current_user
		@book = Book.new
		# @books = Book.all
		# redirect_to book_path(book.id)
	end

	def show
		@users = User.all
		@user = User.find(params[:id])
		@book = Book.new
		@books = Book.where(user_id: @user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		flash[:notice] = 'You have updated user successfully.'
		redirect_to user_path(@user.id)
		else
			flash[:notice] = 'error!'
		render 'edit'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name,:introduction,:profile_image)
	end
	def correct_user
		user = User.find(params[:id])
		if user != current_user
				flash[:notice] = 'error Unauthorized user'
			redirect_to user_path(current_user)
		end
	end
end