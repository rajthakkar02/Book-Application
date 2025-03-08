class BookSellersController < ApplicationController
  def index
    @book_sellers = BookSeller.all
  end

  def new
    @book_seller = BookSeller.new
  end

  def create
    @book_seller = BookSeller.new(book_seller_params)
    if @book_seller.save
      flash[:notice] = "Book Seller created successfully"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @book_seller = BookSeller.find(params[:id])
  end

  def edit
    @book_seller = BookSeller.find(params[:id])
  end

  def update
    @book_seller = BookSeller.find(params[:id])
    if @book_seller.update(book_seller_params)
      flash[:notice] = "Book Seller updated successfully"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def book_seller_params
    params.require(:book_seller).permit(:book_id, :user_id, :seller_price, :quantity)
  end
end
