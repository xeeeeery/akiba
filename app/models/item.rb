class Item < ActiveRecord::Base

  belongs_to :user
  has_many :item_comments
end
