class Admins::RoomsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_room, only: [:edit, :update, :destroy]
  layout 'admins/application'

  # POST /rooms
  # POST /rooms.json
  def create
    @hotel = current_admin.hotels.find(params[:hotel_id])
    unless @hotel
      format.html { render admins_hotel_path(@hotel), alert: 'Room was create failed.'  }
    end
    @room = @hotel.rooms.build(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to admins_hotel_path(@hotel), notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { redirect_to admins_hotel_path(@hotel), alert: 'Room was create failed.'  }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    @hotel = current_admin.hotels.find(params[:hotel_id])
    unless @hotel
      format.html { render admins_hotel_path(@hotel), alert: 'Room was update failed.'  }
    end
    @room = @hotel.rooms.find(params[:id])

    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to admins_hotel_path(@hotel), notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { redirect_to admins_hotel_path(@hotel), alert: 'Room was create failed.' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:code, :room_type_id, :price)
    end
end
