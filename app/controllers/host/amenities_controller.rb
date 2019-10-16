class Host::AmenitiesController < ApplicationController

  def new
    @room = Room.find(params[:room_id])
    @amenity = Amenity.new
  end

  def create
    @room = Room.find(params[:room_id])
      @amenity = @room.amenities.create(amenity_params)
    redirect_to host_room_path(@room)
  end
  

  private



   def amenity_params
    params.require(:amenity).permit(:hometype, :roomtype, :accommodate, :bedroom, :bathroom, :swimming, :air, :tv, :kitchen, :restaurant, :internet)
   end
end
