class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		@book_comment = @book.book_comments.new(book_comment_params)
		@book_comment.book_id = @book.id
        @book_comment.user_id = current_user.id
	  	if @book_comment.save
	  	 redirect_to book_path(@book), notice:'Comment was successfully created.'
	    else
	     #@user = User.find_by(id: @book.user_id)
	     #@user = @book.user
	     #@book_new = Book.new
         #@comments = @book.book_comments
	     #render 'books/show'
	     redirect_to book_path(@book), notice:'Comment cant save.'
		end
	end


	def destroy
		#@book = Book.find(params[:book_id])
		@book_comment = BookComment.find(params[:book_id]) #book_id <= book_comment_id
		@book_comment.destroy
        redirect_to book_path(@book_comment.book.id)
	end
	private
    def book_comment_params
      params.require(:book_comment).permit(:comment)
    end
end

