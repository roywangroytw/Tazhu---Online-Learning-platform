module UsersHelper

    # 這個model有被include進去application_controller為了要給course_controller使用

    def user_signed_in?
        session[:member_sesssion].present?
    end

    def current_user
        # momorization
        @current_user ||= User.find_by(id: session[:member_sesssion])
    end

end
