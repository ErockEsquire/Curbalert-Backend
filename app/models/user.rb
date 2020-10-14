class User < ApplicationRecord
  has_many :posts
  has_many :items, through: :posts

  has_many :dashboards
  has_many :dashboard_items, class_name: 'Item', through: :dashboards

  has_one_attached :avatar

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {:within => 8..20}, allow_nil: true
end
