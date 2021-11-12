class UsersController < ApplicationController

    def sign_up
        @user = User.new
    end

    def registering
        
        # 資料清理
        clean_params = params.require(:user).permit(:username, :password, :email)
        # clean_params = params[:user].permit(:username, :password, :email)

        #把表單傳過來的hash資料喂給實體User.new
        @user = User.new(clean_params)
        if @user.save    
            #註冊資料寫入後端之後，註冊成功，redirect到首頁
            redirect_to "/"
        else
            # 借sign_up.html_erb的畫面來用，但是還保留沒有問題欄位的值
            render :sign_up
        end

    end

end