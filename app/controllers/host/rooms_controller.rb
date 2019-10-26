class Host::RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_room, except: [:index, :new, :create]
  before_action :require_authorized_for_set_current_room, only: [:show]


  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end


  def show
    @amenity = Amenity.new
    @photo = Photo.new
  end


  def edit
    if @room.user != current_user
      return render :new, status: :unprocessable_entity
    end
  end

  def update
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
    @room.destroy
    redirect_to root_path, notice: "Listing Deleted.."
  end

  private


  def require_authorized_for_set_current_room
         redirect_to root_path, alert: "You don't have permission" unless @room.user == current_user
    end

  

  def set_current_room
    @room = Room.find(params[:id])
  end



  def room_params
    params.require(:room).permit(:listing_name, :description, :address, :rate, :image)
  end
end
