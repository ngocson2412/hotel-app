module ApplicationHelper
    #check super admin funtion
    def is_admin?
        current_admin.is_admin == true
    end

    CHARS = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
    def random_password(length=8)
        CHARS.sort_by { rand }.join[0...length]
    end
end
