class Host::RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  before_action :set_room, only: [:show]

  def index
    @rooms = Room.all
  end

  def new
   @room = Room.new
 end
  

  def show
  @amenity = Amenity.new
  @photo = Photo.new
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

  def set_room
    @room = Room.find(params[:id])
    end

  def room_params
    params.require(:room).permit(:listing_name, :description, :address, :rate, :image )
end
end
