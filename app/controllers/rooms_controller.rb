class RoomsController < ApplicationController
  def index
    @rooms = Room.paginate(page: params[:page])
  end

  def show
    @room = Room.find(params[:id])
    @reviews = Review.where(room_id: @room)
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(1)
    end 
  end

end
