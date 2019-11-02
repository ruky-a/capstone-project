class RoomsController < ApplicationController
  def index
  @rooms = Room.paginate(page: params[:page])
  end

  def show
   @room = Room.find(params[:id])
  end

 
end