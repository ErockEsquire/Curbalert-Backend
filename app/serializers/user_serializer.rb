class UserSerializer < ActiveModel::Serializer
  has_many :items
  has_many :dashboard_items, serializer: DashboardItemSerializer
  
  attributes :id, :email, :username, :rating

end