class AuthController < ApplicationController
  def login
    user = User.find_by(email: auth_params[:email])
    if user && user.authenticate(auth_params[:password])
      render json: { token: user.token }, status: :ok
    else
      render json: { messages: ['Email or password wrong'] }, status: :bad_request
    end
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
