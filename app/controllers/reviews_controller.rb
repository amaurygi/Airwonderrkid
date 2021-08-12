class ReviewsController < ApplicationController
  def new
    @property= Property.find(params[:property_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @property = Property.find(params[:property_id])
    @review.property = @property
    @review.save
    redirect_to property_path(@property)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
