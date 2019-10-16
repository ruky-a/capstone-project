class Host::RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @rooms = current_user.rooms
  end

  def new
   @room = Room.new
 end
  

  def show
   @room = Room.find(params[:id])
  end

  def create
    @room = current_user.rooms.create(room_params)
    if @room.save
    redirect_to host_room_path(@room), notice: "Saved..."
  else 
    render :new, status: :unprocessable_entity
  end
  end

  private

  def room_params
    params.require(:room).permit(:listing_name, :description, :address, :rate)
end
end
