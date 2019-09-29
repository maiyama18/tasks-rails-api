class UsersController < ApplicationController
  def create
    user = User.new(username: user_params[:username], email: user_params[:email].downcase, password: user_params[:password])
    if user.save
      render json: { token: user.token }, status: :created
    else
      render json: { messages: user.errors.full_messages }, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
