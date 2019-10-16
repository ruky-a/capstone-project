require 'rails_helper'

RSpec.describe Host::RoomsController, type: :controller do
  describe "host/rooms#new action" do
    it "should successfully show the new form" do
    get :new
    expect(response).to_have_http_status(:success)
  end
end
  


  describe "host/rooms#create action" do
    it "should successfully create a new room" do
      post :create, params: {room: {listing_name: "listing", description: "description", address: "address", rate: '1'} }
       expect(response).to redirect_to host_room_path
     end
   end

     describe "host/rooms#show action" do
    it "should successfully show the page if room" do
      get :show, params: {id: 1}
      expect(response).to have_http_status(:success)
  end
end
end
