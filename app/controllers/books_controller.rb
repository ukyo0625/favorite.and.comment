class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@books = Book.all
  	@book_new =Book.new
    @user =current_user
  end

  def show
  	@book_new = Book.new
  	@book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
    @book_comment = BookComment.new

  end

  def edit
  	@book =Book.find(params[:id])
    if @book.user_id != current_user.id
     redirect_to books_path
    end
  end

  def create
  	@book_new =Book.new(book_params)
    @book_new.user_id = current_user.id
  	if @book_new.save
  	 redirect_to book_path(@book_new), notice:'Book was successfully created.'
    else
     @books =Book.all
     @user =current_user
     render :index
    end
  end

  def update
  	@book =Book.find(params[:id])
  	if @book.update(book_params)
  	redirect_to book_path(@book.id), notice:'Book was successfully update.'
    else
  	render :edit
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end
  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
end
