class Admins::RoomTypesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_room_type, only: [:show, :edit, :update, :destroy]
  layout 'admins/application'

  # GET /room_types
  # GET /room_types.json
  def index
    @room_types = RoomType.all
    @room_type = RoomType.new
  end

  # POST /room_types
  # POST /room_types.json
  def create
    @room_type = RoomType.new(room_type_params)

    respond_to do |format|
      if @room_type.save
        format.html { redirect_to admins_room_types_path, notice: 'Room type was successfully created.' }
        format.json { render :show, status: :created, location: @room_type }
      else
        format.html { redirect_to admins_room_types_path, alert: 'Room type create fail.' }
        format.json { render json: @room_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_types/1
  # PATCH/PUT /room_types/1.json
  def update
    respond_to do |format|
      if @room_type.update(room_type_params)
        format.html { redirect_to admins_room_types_path, notice: 'Room type was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_type }
      else
        format.html { redirect_to admins_room_types_path, alert: 'Room type update fail.' }
        format.json { render json: @room_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_types/1
  # DELETE /room_types/1.json
  def destroy
    @room_type.destroy
    respond_to do |format|
      format.html { redirect_to room_types_url, notice: 'Room type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_type
      @room_type = RoomType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_type_params
      params.require(:room_type).permit(:name)
    end
end
