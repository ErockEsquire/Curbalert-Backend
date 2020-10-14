class AuthController < ApplicationController
  before_action :authenticated, only: [:autologin]

  def login
    user = User.where('lower(email) = ?', params[:entry].downcase).first
    user = User.where('lower(username) = ?', params[:entry].downcase).first if user.nil?
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user
    else
      render json: { error:"Invalid email/username or password" }, status: :unauthorized
    end
  end

  def autologin
    render json: @current_user
  end

  def logout
    reset_session
    render json: { message: "Logged out" }
  end

end