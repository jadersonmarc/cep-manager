# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
    user = User.find_by(email: user_params[:email])

    if user && user.valid_password?(user_params[:password])
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user, status: 200
    else
      render json: { errors: 'Invalid password or email' }, status: 401
    end
   end

   protected
   
   def user_params
    params.required(:sign_in)
          .permit(:email, :password)
   end
end
