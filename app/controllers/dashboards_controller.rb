class DashboardsController < ApplicationController
before_action :authenticate_user!


def show
  @rooms = current_user.rooms
end
end
