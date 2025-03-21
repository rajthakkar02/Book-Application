class HomeController < ApplicationController
  def index
    if user_signed_in? && current_user.role == "customer"
      @books_seller = BookSeller.paginate(page: params[:page], per_page: 30).order(:created_at)
    elsif user_signed_in? && current_user.role == "seller"
    elsif user_signed_in? && current_user.role == "author"
      @books = Book.where(user_id: current_user.id).paginate(page: params[:page], per_page: 30).order(:created_at)
      @rating = Feedback.where(user_id: current_user.id).average(:rating).to_f
    else
      @q = BookSeller.ransack(params[:q])
      @books_seller = @q.result(distinct: true).paginate(page: params[:page], per_page: 30).order(:created_at)
    end
  end
end
