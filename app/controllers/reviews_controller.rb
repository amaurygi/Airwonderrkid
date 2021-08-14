class ReviewsController < ApplicationController
  def create
    @property = Property.find(params[:property_id])
    @review = Review.new(review_params)
    @review.property = @property
    if @review.save
      redirect_to property_path(@property, anchor: "review-#{@review.id}")
    else
      render 'properties/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end