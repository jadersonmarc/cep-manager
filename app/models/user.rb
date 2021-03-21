class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         ATTRIBUTES = %i[
            confirm_password
            password
            email
            auth_token
        ]

         validates_presence_of :email
         validates_uniqueness_of :email
         validates_confirmation_of :password
         validates_uniqueness_of :auth_token

         def info
          "#{email} - #{created_at} - Token: #{Devise.friendly_token}"
        end

        def generate_authentication_token!
          begin
            self.auth_token = Devise.friendly_token
          end while User.exists?(auth_token: auth_token)
        end
end
