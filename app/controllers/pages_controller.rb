class PagesController < ApplicationController
  def index
    @rooms = Room.limit(3)
  end

def search
if params[:search].present? && params[:search].strip != ""
  session[:loc_search] = params[:search]
end

  arrResult = Array.new

  if session[:loc_search] && session[:loc_search] != ""
    @rooms_address = Room.near(session[:loc_search], 5, order: 'distance')
  else
   @rooms_address = Room.all
  end

  @search = @rooms_address.ransack(params[:q])
  @rooms = @search.result


  @arrRooms = @rooms.to_a

  if (params[:start_date] && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty?)
    start_date = Date.parse(params[:start_date])
     end_date = Date.parse(params[:end_date])

     @rooms.each do |room|

      not_available = room.reservations.where(
        "(? <= start_date AND start_date <= ?)
      OR (? <= end_date AND end_date <= ?)
      OR (start_date <? AND ? < end_date)",
      start_date, end_date,
      start_date, end_date,
      start_date, end_date).limit(1)

      if not_available.length > 0
        @arrRooms.delete(room)
      end
    end
  end
 @api = TravelPayouts.api
prices = @api.cheap_prices(origin: 'ODS', destination: 'MOW', depart_date: '2015-04-01')
hotel_search_start(city_id:nil,hotel_id:nil,iata:nil,check_in:,check_out:,adults_count:,user_ip:,
  children_count:0,child_age1:0,child_age2:0,child_age3:0,lang:nil,currency:nil,wait_for_result:0,timeout:
  end



end
