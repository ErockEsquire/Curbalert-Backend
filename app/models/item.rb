class Item < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts
  
  has_many :dashboards
  has_many :dashboard_users, class_name: 'User', through: :dashboards

  has_one_attached :image
end
