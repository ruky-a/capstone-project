require 'rails_helper'

RSpec.describe Host::RoomsController, type: :controller do
   describe "host/rooms#new action" do
    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end



    it "should successfully show the new form" do
      user = FactoryBot.create(:user)
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
  end
end

  

  describe "host/rooms#create action" do
   it "should require users to be logged in" do
    post :create, params: {room: {listing_name: "listing", Description: "description", Address: "address", Rate: '1'} }
    expect(response).to redirect_to(new_user_session_path)
   end
 end


     describe "host/rooms#show action" do
    it "should successfully show the page to the user" do
     room = FactoryBot.create(:room)
     get :show, params: { id: room.id}
     expect(response).to have_http_status(:success)
    end
  end



 describe "host/rooms#destroy action" do
   it "shouldn't let unauthenticated users destroy a room" do
    room = FactoryBot.create(:room)
    delete :destroy, params: { id: room.id }
    expect(response).to redirect_to new_user_session_path
  end



  it "should allow a user to destroy rooms" do
    room = FactoryBot.create(:room)
    sign_in room.user
    delete :destroy, params: {id: room.id}
    expect(response).to redirect_to root_path
    room = Room.find_by_id(room.id)
    expect(room).to eq nil
    

  end

  it "should return a 404 message if we cannot find a room with the id that is specified" do
    delete :destroy, params: { id: 'SPACEDUCK'}
    expect(response).to have_http_status(:found)

  end
end    


    describe "host/rooms#update action" do
      it "should allow users to successfully update room" do
        room = FactoryBot.create(:room, description: 'Initial Value')
        sign_in room.user

        patch :update, params: { id: room.id, room: { description: 'Changed' }}
        expect(response).to redirect_to host_room_path
      end


      it "shouldn't let authenticated users update a room" do
        room = FactoryBot.create(:room)
        patch :update, params: { id: room.id, room: {message: "Hello"}} 
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "host/rooms#edit action" do
      it "shouldn't let a user who did not create the room update it" do
        room = FactoryBot.create(:room)
        user = FactoryBot.create(:user)
        sign_in user
        get :edit, params: {id: room.id }
        expect(response).to have_http_status(:forbidden)
        end


      it "shouldn't let unauthenticated users edit a room" do 
        room = FactoryBot.create(:room)
        get :edit, params: { id: room.id }
        expect(response).to redirect_to new_user_session_path
      end

    end

   end




