class ReviewsController < ApplicationController



  def create
  @room = Room.find(params[:room_id])
  @room.reviews.create(review_params.merge(user: current_user, reservation_id: @reservation_id))
    flash[:success] = "Review created..."
   redirect_back(fallback_location: request.referer)
  end


  private



  def review_params
    params.require(:review).permit(:message, :rating)
  end
end


