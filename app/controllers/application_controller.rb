class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters,if: :devise_controller? 
    layout :layout

    private

    def layout
        if devise_controller?
            false
        else
            "application"
        end
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    end

    # Overwriting the sign_out redirect path method
    def after_sign_in_path_for(resource)
        stored_location_for(resource) ||
        if resource.is_a?(User)
            root_path
        elsif resource.is_a?(Admin)
            admins_home_index_path
        else
            super
        end
    end    
end
