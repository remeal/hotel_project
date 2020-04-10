class MainController < ApplicationController
  before_action :authenticate_user!, only: [:booking, :success]
  def index; end

  def search
    arr_type_id = []
    flash[:date_in] = params[:date_in]
    flash[:date_out] = params[:date_out]
    check = data_check(params[:data_in],params[:data_out],params[:search])
    if check.nil?
      @types = nil
    else
      check.each do |elem|
        arr_type_id.push(Room.find_by_number(elem)[:type_id])
      end
      arr_type_id.uniq
      @types = Type.where(id: arr_type_id)
    end
  end

  def data_check(data_in, data_out, quantity)
    arr_empty = []
    arr_all = Room.where(type_id: Type.where(quantity: quantity))
    arr_all.each do |arr|
      OccupiedDate.find_by_room_id(arr.number).nil? ? arr_empty.push(arr.number) : nil
    end
    if arr_empty.empty?
      arr_occ = OccupiedDate.where(room: Room.where(number: Type.where(quantity: quantity)))
      time_in = (Time.parse(data_in) + 86400).to_s[0,10]
      time_out = (Time.parse(data_out) - 86400).to_s[0,10]
      arr_occ.each do |arr|
        if (OccupiedDate.find_by_room_id(Room.where(number: arr.room))[:date] == time_in) | (OccupiedDate.find_by_room_id(Room.where(number: arr.room))[:date] == time_out)
          arr_occ.delete(arr)
        end
      end
      arr_occ.empty? ? nil : arr_occ
    else
      arr_empty
    end
  end

  def view
    @types = Type.find_by_id(params[:type_value])
    @date_in = flash[:date_in]
    @date_out = flash[:date_out]
  end

  def booking
    @type = Type.find_by_id(params[:type_value].split(' ')[0])
    @eating = Eating.find_by_description(params[:handling])
    @date_in = params[:type_value].split(' ')[1]
    @date_out = params[:type_value].split(' ')[2]
    @sum = sum(@date_in, @date_out, @type.price, @eating.price)
  end

  def success
    date_in = params[:type_value].split(' ')[2]
    date_out = params[:type_value].split(' ')[3]
    eating = params[:type_value].split(' ')[1]
    phone = params[:phone]
    sum = params[:type_value].split(' ')[4]
    room = data_check(date_in, date_out, Type.find_by_id(params[:type_value].split('')[0])[:quantity])[0]
    Booking.create(sum: sum, room: Room.find_by_number(room), date_in: date_in, date_out: date_out, eating: Eating.find_by_id(eating), phone: phone, user: User.find_by_email(current_user.email), name: User.find_by_name(current_user.name)[:name])
    days = (Time.parse(date_out) - Time.parse(date_in))/86400
    for i in 0..days
      OccupiedDate.create(room: Room.find_by_id(room), date: (Time.parse(date_in) + 86400 * i))
    end
  end

  def room_check(id)

  end

  def sum(datein, dateout, priceroom, priceeat)
    days = (Time.parse(dateout) - Time.parse(datein))/86400
    (priceroom + priceeat) * days
  end
end
