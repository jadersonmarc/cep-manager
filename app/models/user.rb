class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         ATTRIBUTES = %i[
            confirm_password
            password
            email
        ]

         validates_presence_of :email
         validates_uniqueness_of :email
         validates_confirmation_of :password
end
