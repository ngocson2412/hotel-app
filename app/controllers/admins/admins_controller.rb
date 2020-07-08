class Admins::AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy, :update_pwd]
  layout 'admins/application'
  before_action :authenticate_admin!, :is_admin!

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.where(is_admin: false)
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_new_params)
    password = random_password(8)
    @admin.password = password

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_admin_path(@admin), notice: 'Admin was successfully created with password : ' +  password}
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { redirect_to new_admins_admin_path, alert: 'Admin create failed.'  }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admins_admin_path(@admin), notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render admins_admin_path(@admin) }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update_pwd
    respond_to do |format|
      # if (admin_pwd_params[:password] == admin_pwd_params[:password_confirmation])
      if @admin.update(admin_pwd_params)
        format.html { redirect_to admins_admin_path(@admin), notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { redirect_to admins_admin_path(@admin), alert: 'Change Password failed.'}
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :user_number, :phone, :city, :addr_1, :addr_2, :desc)
    end

    # Only allow a list of trusted parameters through.
    def admin_new_params
      params.require(:admin).permit(:name, :email, :first_name, :last_name, :user_number, :phone, :city, :addr_1, :addr_2, :desc)
    end

    # Only allow a list of trusted parameters through.
    def admin_pwd_params
      params.require(:admin).permit(:password, :password_confirmation)
    end

    def is_admin!
      unless (current_admin.is_admin)
        redirect_to admins_home_index_path, alert: 'You are permission denied.' 
      end
    end
end
