class Host::PhotosController < ApplicationController


  def new
     @room = Room.find(params[:room_id])
    @photo = Photo.new
  end 

  def create
   @room = Room.find(params[:room_id])
   @photo = @room.photos.create(photo_params)
    redirect_to host_room_path(@room)
  end

  def show
  end

  def destroy
 @photo =  Photo.find_by_id(params[:id])

    @photo.purge

    room = @photo.room

    @photo.purge
    @photos = Photo.where(room_id: room.id)

    respond_to :js
  end



    private 
    
    def photo_params
    params.require(:photo).permit(:caption, images: [])
  end
end
