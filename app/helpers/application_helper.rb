module ApplicationHelper
    #check super admin funtion
    def is_admin?
        current_admin.is_admin == true
    end
end
