class HomeController < ApplicationController
  def index
    @books_seller = BookSeller.all
  end
end
