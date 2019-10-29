require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
      describe "room/reservations#create action" do
      it "should successfully show the reservation form and allow reservations to be created " do
      user = FactoryBot.create(:user)
       room = FactoryBot.create(:room)
      sign_in room.user
      expect(response).to have_http_status(:success)
    end
  end
end

  