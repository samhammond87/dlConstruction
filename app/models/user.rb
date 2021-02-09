class User < ApplicationRecord
    has_secure_password
    has_many :timesheets
    
    # validates user fields
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 8 }


end
