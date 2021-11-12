class User < ApplicationRecord
    validates :username, presence: true
    # validates (:username, {presence: true})
end
