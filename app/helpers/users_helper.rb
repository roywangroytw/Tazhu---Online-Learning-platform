module UsersHelper

    def user_signed_in?
        session[:member_sesssion].present?
    end

end