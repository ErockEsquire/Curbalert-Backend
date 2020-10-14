class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create(email: params[:email], username: params[:username], first_name: params[:first_name], last_name: params[:last_name], password: params[:password], rating: 0)
    session[:user_id] = user.id
    render json: user
  end
  
  def dashboard
    user = User.find(params[:id])
    items = user.dashboard_items
    render json: items
  end

end
