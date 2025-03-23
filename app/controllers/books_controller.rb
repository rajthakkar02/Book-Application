class BooksController < ApplicationController
  before_action :authenticate_user!, except: %i[show]

  def new
    @book = Book.new
    @book.user_id = current_user.id
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

  def show
    @book = Book.find(params[:id])
    @book_seller = BookSeller.find_by(book_id: params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.user != current_user
      flash[:alert] = "You are not authorized to edit this book"
      redirect_to root_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.user != current_user
      flash[:alert] = "You are not authorized to edit this book"
      redirect_to root_path
    elsif @book.update(book_params)
      flash[:notice] = "Book updated successfully"
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user != current_user
      flash[:alert] = "You are not authorized to delete this book"
      redirect_to root_path
    else
      @book.destroy
      flash[:notice] = "Book deleted successfully"
      redirect_to root_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:book_name, :book_image, :MRP, :pages, :publisher_name, :publication_date, :language, :description, :book_image)
  end
end
