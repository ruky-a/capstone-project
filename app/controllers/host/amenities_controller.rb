class Host::AmenitiesController < ApplicationController
  before_action :set_current_room, except: [:show]

  def new
    @amenity = Amenity.new
    
  end

  def create
    @amenity = @room.amenities.create(amenity_params)
    redirect_to host_room_path(@room)
  end

  def show
  end




  private

  def set_current_room
    @room = Room.find(params[:room_id])
  end

  def amenity_params
    params.require(:amenity).permit(:hometype, :roomtype, :accommodate, :bedroom, :bathroom, :swimming, :air, :tv, :kitchen, :restaurant, :internet)
  end
end
