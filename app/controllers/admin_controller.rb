class AdminController < ApplicationController
  def index; end

  def new_guests; end

  def add_new_guests
    if (Booking.find_by_id(params[:add_guests]).nil?) || (!Guest.find_by_booking_id(params[:add_guests]).nil?)
           @booking = nil
    else
      @booking = Type.find_by_id(Room.find_by_number(Booking.find_by_id(params[:add_guests])[:room_id])[:type_id])[:quantity]
    end
    flash[:add_guests] =  params[:add_guests]
  end

  def success_to_add
    for i in 1..params[:type_value].to_i
      Guest.create(password: params[:passport.to_s + i.to_s], surname: params[:surname.to_s + i.to_s],
                   name: params[:name.to_s + i.to_s], patronymic: params[:patronymic.to_s + i.to_s], booking: Booking.find_by_id(flash[:add_guests]))
    end
  end


  def guests
    @guests = Guest.where(leave: false)
  end


  def adminsafe
    Guest.find_by_id(params[:value]).update(leave: true)
  end
end
