class ReviewsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @review = Review.new(review_params)
    # the id of the foreign key car_id is still nil if you raise and check @review
    @review.car = @car
    if @review.save
      redirect_to car_path(@car)
    else
      render "cars/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :car_id)
  end
end
