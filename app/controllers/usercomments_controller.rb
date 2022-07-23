class UsercommentsController < ApplicationController
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @review = @hotel.reviews.find(params[:review_id])
    @usercomment = @review.usercomments.create(comment_params)
    redirect_to hotel_path(@hotel)
  end

  private
    def comment_params
      params.require(:usercomment).permit(:body)
    end
end
