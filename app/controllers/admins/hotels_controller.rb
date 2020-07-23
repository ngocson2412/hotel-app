class Admins::HotelsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  layout 'admins/application'
  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = Hotel.all
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
    @room = Room.new
    room_types = RoomType.all
    @room_type_array = []
    room_types.each do |room_type|
      @room_type_array.push([room_type.name, room_type.id])
    end
    @booking_list = []
    @hotel.bookings.each do |booking|
      @booking_list[booking.id] = booking
    end
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = current_admin.hotels.build(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to admins_hotel_path(@hotel), notice: 'Hotel was successfully created.' }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to admins_hotel_path(@hotel), notice: 'Hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url, notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(:name, :hotel_code, :phone, :public, :desc, :desc_s, :city, :addr_1, :addr_2, :desc)
    end
end
