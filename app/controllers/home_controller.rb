class HomeController < ApplicationController
  def index
    if user_signed_in? && current_user.role == "customer"
      @books_seller = BookSeller.all
    elsif user_signed_in? && current_user.role == "seller"
    elsif user_signed_in? && current_user.role == "author"
      @books = Book.where(user_id: current_user.id)
    else
      @books_seller = BookSeller.all
    end
  end
end
