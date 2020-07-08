class Admins::ProfileController < ApplicationController
  layout 'admins/application'
  before_action :authenticate_admin!

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if current_admin.update(admins_profile_params)
        format.html { redirect_to admins_customer_profile_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: current_admin }
      else
        format.html { render admins_customer_profile_edit_path, alert: 'Profile update fail.'  }
        format.json { render json: current_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_pwd
    respond_to do |format|
      # if (admin_pwd_params[:password] == admin_pwd_params[:password_confirmation])
      if current_admin.update(admins_profile_pwd_params)
        format.html { redirect_to new_admin_session_path, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location:current_admin }
      else
        format.html { redirect_to admins_customer_profile_path, alert: 'Change Password failed.'}
        format.json { render json: current_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def admins_profile_params
      params.require(:admin).permit(:first_name, :last_name, :user_number, :phone, :city, :addr_1, :addr_2, :desc)
    end

    # Only allow a list of trusted parameters through.
    def admins_profile_pwd_params
      params.require(:admin).permit(:password, :password_confirmation)
    end
end
