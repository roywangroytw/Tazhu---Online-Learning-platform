class UsersController < ApplicationController

    def sign_up
        @user = User.new
    end

    def registering

        #把表單傳過來的hash資料喂給實體User.new
        @user = User.new(user_params)
        if @user.save    
            #註冊資料寫入後端之後，註冊成功，redirect到首頁
            redirect_to "/"
        else
            # 借sign_up.html_erb的畫面來用，但是還保留沒有問題欄位的值
            render :sign_up
            # flash[:alert] = "Account can't be blank!"
        end

    end

    def sign_in
        @user = User.new
    end

    def check

        # email = params[:user][:email]
        # password = params[:user][:password]

        # salted_password = "xyz#{password.reverse}hellohey"
        # encrypted_password = Digest::SHA1.hexdigest(salted_password)

        # u = User.find_by(email: email, password: encrypted_password)

        # 以上太囉唆了，可以把他們寫在Model的地方，定義一個login類別方法

        u = User.login(user_params)

        if u
            #[:member_seesion] 這其實可以自己隨意命名
            # u.id 這邊其實也可以自己決定要怎麼寫，老師示範的例子是直接拿uid來當作session id
            session[:member_sesssion] = u.id
            flash[:notice] = "已登入，歡迎回來！"
            redirect_to "/"
        else
            render html: "Not OK!"
        end   

    end

    def sign_out
        session[:member_sesssion] = nil
        flash[:notice] = "已登出"
        redirect_to "/"
    end

    private

    def user_params

        # 資料清理
        clean_params = params.require(:user).permit(:username, :password, :email)
        # clean_params = params[:user].permit(:username, :password, :email)
        
    end

end