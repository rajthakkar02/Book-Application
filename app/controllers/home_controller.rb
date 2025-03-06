class HomeController < ApplicationController
  def index
    if user_signed_in? && current_user.role == "customer"
      @books_seller = BookSeller.all
    elsif user_signed_in? && current_user.role == "seller"
      # Add logic for when the user is a seller
    elsif user_signed_in? && current_user.role == "author"
      # Add logic for when the user is an author
    else
      @books_seller = BookSeller.all
    end
  end
end
