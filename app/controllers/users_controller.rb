class UsersController < ApplicationController

    def sign_up
    end

    def registering

        puts "-------------------------------------"
        puts params
        puts "-------------------------------------"
        #註冊資料寫入後端之後，註冊成功，redirect到首頁
        redirect_to "/"
    end

end