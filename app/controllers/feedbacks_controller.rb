class FeedbacksController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @feedback = Feedback.new(feedback_params)
    @feedback.user = @book.user
    @feedback.name = current_user.name
    @feedback.current_user = current_user.id
    if @feedback.save
      flash[:notice] = "Feedback added successfully"
      redirect_to book_path(@book)
    else
      render "books/show"
    end
  end

  def edit
    @book = Book.find(params[:id])
    @feedback = @book.feedbacks.find(params[:book_id])
  end

  def update
    @book = Book.find(params[:book_id])
    @feedback = @book.feedbacks.find(params[:id])
    if @feedback.update(feedback_params)
      flash[:notice] = "Feedback updated successfully"
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @feedback = @book.feedbacks.find(params[:book_id])
    @feedback.destroy
    flash[:notice] = "Feedback deleted successfully"
    redirect_to book_path(@book)
  end

  private

  def feedback_params
    params.require(:feedback).permit(:rating, :comment, :user_id, :book_id, :current_user)
  end
end
