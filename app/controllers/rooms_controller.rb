class RoomsController < ApplicationController
  def index
    @rooms = Room.paginate(page: params[:page])
  end

  def show
    @room = Room.find(params[:id])
     @guest_reviews = @room.guest_reviews
  end

end
