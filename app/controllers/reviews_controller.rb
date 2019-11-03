class ReviewsController < ApplicationController



  def create
  @room = Room.find(params[:room_id])
  @room.reviews.create(review_params.merge(user: current_user))
    flash[:success] = "Review created..."
   redirect_to room_path(@room)
  end


  private



  def review_params
    params.require(:review).permit(:message, :rating)
  end
end


