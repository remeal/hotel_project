class AdminController < ApplicationController
  def index; end

  def new_guests; end

  def add_new_guests
    @booking = Type.find_by_id(Room.find_by_number(Booking.find_by_id(params[:add_guests])[:room_id])[:type_id])[:quantity]
  end

  def success_to_add
    booking = params[:type_value]
  end
  def guests

  end
end
