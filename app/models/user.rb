# require 'digest' to use SHA1 encryption function
require 'digest'

class User < ApplicationRecord
    validates :username, presence: true
    # validates (:username, {presence: true})

    #驗證email必須存在，並且是唯一值
    validates :email, presence: true, uniqueness: true

    #驗證email的格式必須正確（請務必也記得在FE form的部分input使用email type, 這樣有雙層保護
    # approach 1:
    # validates_format_of :email, { :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "This is not the correct email format!" }
    # approach 2: (新式寫法):
    validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
    message: "This is not the correct email format!" }

    before_create :encrypt_password

    private

    def encrypt_password
        
        # salting
        salted_password = "xyz#{self.password.reverse}hellohey"
        self.password = Digest::SHA1.hexdigest(salted_password)
        # self.password = Digest::SHA1.hexdigest(password)
        # password = Digest::SHA1.hexdigest(self.password) > 會出錯！因為等號前是區域變數
        # self.password=(Digest::SHA1.hexdigest(self.password))
        # setter                                   getter
        # 當Rails幫我們建立資料表的欄位時，會自動幫我們加上 accessor（ reader & writer )
    end

end
