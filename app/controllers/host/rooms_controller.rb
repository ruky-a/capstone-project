class Host::RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  

  def index
    @rooms = current_user.rooms
  end

  def new
   @room = Room.new
 end
  

  def show
   @room = Room.find(params[:id])
  @amenity = Amenity.new
  @photo = Photo.new
   end

   def edit
    @room = Room.find(params[:id])

    if @room.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    else
      render :new, status: :unprocessable_entity
    end
   end

   def update
    @room = Room.find(params[:id])
    if @room.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end 
    if @room.update_attributes(room_params)
    redirect_to host_room_path(@room), notice: "Listing Updated..."
  else
    render :new, status: :unprocessable_entity
  end
  end



  def create
    @room = current_user.rooms.create(room_params)
    if @room.save
    redirect_to host_room_path(@room), notice: "Saved..."
  else 
    render :new, status: :unprocessable_entity
  end
  end

  def destroy
    @room = Room.find(params[:id])
    return render_not_found if @room.blank?
    return render_not_found(:forbidden) if @room.user != current_user
    @room.destroy
    redirect_to root_path, notice: "Listing Deleted.."
  end

  private



  def room_params
    params.require(:room).permit(:listing_name, :description, :address, :rate, :image)
end
end
