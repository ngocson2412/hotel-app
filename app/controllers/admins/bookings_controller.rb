class Admins::BookingsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  layout 'admins/application'

  # GET /bookings
  # GET /bookings.json
  def index
    @booking_list = Array.new
    current_admin.hotels.each do |hotel|
      hotel.bookings.each do |booking|
        @booking_list[booking.id] = booking
      end
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @hotels = current_admin.hotels.select ['id', 'name']
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
    @hotels = current_admin.hotels.select ['id', 'name']
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        flash[:notice] = "Booking was successfully created."
        format.html { redirect_to admins_bookings_path, notice: 'Booking was successfully created.' }
        format.json { render json: @booking, status: :created}
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      @booking.booking_rooms.destroy_all
      if @booking.update(booking_params)
        format.html { redirect_to edit_admins_booking_path(@booking), notice: 'Booking was successfully updated.' }
        format.json { render json: @booking, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:check_in_day, :pay_flag, :book_status, :check_out_day, :book_user_name, :book_user_phone, :book_user_number, :book_people_number, :book_total_amount, :book_memo, booking_rooms_attributes: [:hotel_id, :room_id])
    end
end
