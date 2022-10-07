class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(reviews_params)
    @review.user = @user
    if @review.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_path(@review.user), status: :see_other # preguntar
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
