class RoomsController < ApplicationController
  before_action :room_set, only: [:new]
  def index
  end
  def new
  end

  private
  def room_set
    @room = Room.new
  end
end
