class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, unqueness: true
    validates :email, presence: true, uniqueness: true
end
