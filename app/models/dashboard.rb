class Dashboard < ApplicationRecord
  belongs_to :dashboard_user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :dashboard_item, :class_name => 'Item', :foreign_key => 'item_id'
end
