class ItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  has_many :users
  attributes :id, :name, :category, :quality, :street_address, :city_address, :state_address, :zip_address, :comment, :time, :date, :latitude, :longitude, :claimed, :image_url, :users

  def image_url
    return rails_blob_url(object.image)
  end

  def users
    self.object.users.map do |user|
      {id: user.id, 
       username: user.username,
       rating: user.rating}
    end 
  end

end