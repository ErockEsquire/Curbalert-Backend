class ItemsController < ApplicationController

  def index
    items = Item.all
    render json: items
  end

  # def getActive
  #   items = Item.where('created_at >= ?', 3.days.ago)
  #   render json: items
  # end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if params[:claimed]
      user = item.users.first
      rating = user.rating + 1
      user.update_attribute(:rating, rating)
    end
    render json: item
  end

  def create
    item = Item.create(name: params[:item][:name], category: params[:item][:category], quality: params[:item][:quality], street_address: params[:item][:street_address], city_address: params[:item][:city_address], state_address: params[:item][:state_address], zip_address: params[:item][:zip_address], comment: params[:item][:comment], time: params[:item][:time], date: params[:item][:date], latitude: params[:item][:latitude], longitude: params[:item][:longitude], claimed: params[:item][:claimed])
    item.image.attach(params[:item][:image])
    Post.create(item_id: item.id, user_id: params[:user][:id])
    render json: item
  end

  def dashboard
    user = User.find(params[:user][:id])
    user.dashboard_items.destroy_all
    dashboard = params[:dashboard]
    dashboard.each do |dashboard_item|
      item = Item.find(dashboard_item[:id])
      Dashboard.create(item_id: item[:id], user_id: params[:user][:id])
    end

    render json: item
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: { message: deleted }
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :category, :quality, :address, :comment, :quantity, :time, :date, :latitude, :longitude, :claimed, :final, :image, :rating)
  end

  def user_params
    params.require(:user).permit(:name, :rating)
  end

end
