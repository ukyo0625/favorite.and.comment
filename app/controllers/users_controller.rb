class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		@book_new =Book.new
		@books = Book.all
		@user = User.find(current_user.id)
		@users =User.all
	end
	def show
		@book_new =Book.new
		@user = User.find(params[:id])
		@books = @user.books
	end
	def edit
		@user = User.find(params[:id])
        if @user != current_user
          redirect_to current_user
        end
	end
	def create
	end
	def update
		@user =User.find(params[:id])
  	if @user.update(user_params)
  	redirect_to user_path(@user.id), notice:'Book was successfully update.'
    else
  	render :edit
    end
	end
	def dastroy
	end



	private
	def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
