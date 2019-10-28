class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:room_id])

    if current_user == room.user 
      flash[:alert] = "You cannot book your own property!"
    else
    start_date = Date.parse(reservation_params[:start_date])
    end_date = Date.parse(reservation_params[:end_date])
    days = (end_date - start_date).to_i + 1
    @reservation = current_user.reservations.create(reservation_params)
    @reservation.room = room
    @reservation.rate = room.rate
    @reservation.total = room.rate * days
    @reservation.save

    flash[:notice] = "Booked Successfully"
    redirect_to room
  end

  end

  
  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
