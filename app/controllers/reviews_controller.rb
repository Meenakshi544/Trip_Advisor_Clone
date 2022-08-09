class ReviewsController < ApplicationController
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @review = @hotel.reviews.new(review_params)
    if @review.save
      redirect_to hotel_path(@hotel)
    else
      flash[:alert] =@review.errors.full_messages
      redirect_to hotel_path(@hotel), status: :unprocessable_entity
    end
  end

  def update
    @hotel = Hotel.find(params[:hotel_id])
    @review= @hotel.reviews.find(params[:id])
    if @review.update_column(:approved_by, current_user.id)
      redirect_to hotel_path(@hotel)
    else
      redirect_to hotel_path(@hotel)
    end
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @review= @hotel.reviews.find(params[:id])
    @review.destroy
    redirect_to hotel_path(@hotel), status: :see_other
  end

  private
    def review_params
      params.require(:review).permit(:rating, :comment, :approved_by, pictures: [])
    end
end
