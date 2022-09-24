class User < ApplicationRecord 
    validates :email, presence: true, uniqueness: true
    validates_presence_of :password, require: true
    validates_presence_of :password_confirmation, require: true

    before_save :create_api_key

    has_secure_password

    def create_api_key
        self.api_key = SecureRandom.hex 
    end 
end 