class Host::PhotosController < ApplicationController
  before_action :authenticate_user!

  # def new
  #   @room = Room.find(params[:room_id])
  #   @photo = Photo.new
  # end 

  def create
    @room = Room.find(params[:room_id])

    if params[:images]
      params[:images].each do |img|
       @room.photos.create(image: img)
      end

      @photos = @room.photos
    @photo = @room.photos.create(photo_params)
    redirect_to host_room_path(@room)
  end
 end

  def show
  end

  # def destroy
  #   @photo = Photo.find(params[:id])
  #   @room = @photo.room
  #   @photo.images.first.purge
  #   @photos = Photo.where(room_id: @room.id)
  #   respond_to :js

  # end



  private 

  def photo_params
    params.require(:photo).permit(:caption, images: [])
  end
end

