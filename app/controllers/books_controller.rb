class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      flash[:notice] = "Book added successfully"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:book_name, :book_image, :MRP, :pages, :publisher_name, :publication_date, :language, :description, :book_image)
  end
end
