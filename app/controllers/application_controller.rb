class ApplicationController < ActionController::Base

    include UsersHelper

    rescue_from ActiveRecord::RecordNotFound, with: :result_not_found

    private

    def result_not_found
        render file: 'public/404.html', layout: false, status: 404
    end

        # 拿來使用callback確保某些頁面一定要登入才可以看到，控制權限
    
    def login?
      if not user_signed_in?
          redirect_to sign_in_path, notice: '請先登入'
      end    
    end



end
