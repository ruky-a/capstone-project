class Host::RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_room, except: [:index, :new, :create]
  before_action :require_authorized_for_set_current_room, only: [:show, :photo_upload]


  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
 end

  def show
    @room = Room.find(params[:id])
    @amenity = Amenity.new
    @photos = Photo.new
  end

  def photo_upload
  @photos = @room.photos
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


  def preload
    today = Date.today
    reservations = @room.reservations.where("start_date >= ? OR end_date >= ?) AND status = ?", today, today, 1)

    render json: reservations
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
    if @room.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end 


    @room.destroy
    redirect_to root_path, notice: "Listing Deleted.."
  end


  def preview

    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
      conflict: is_conflict(start_date, end_date, @room)
    }

    render json: output
  end


  private

  def is_conflict(start_date, end_date, room)
    check = room.reservations.where("? < start_date AND end_date < ?) AND status = ?", start_date, end_date, 1)
    check.size > 0? true :false
  end


  def require_authorized_for_set_current_room
    redirect_to root_path, alert: "You don't have permission" unless @room.user.id == current_user.id
  end



  def set_current_room
    @room = Room.find(params[:id])
  end



  def room_params
    params.require(:room).permit(:listing_name, :description, :address, :home_type, :room_type, :adult, :kids, :bedroom, :bathroom, :rate, :web_url, :video, :thumbnail, :instant, images: [])
  end
end
