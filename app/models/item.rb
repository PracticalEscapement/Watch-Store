class Item < ApplicationRecord

  has_many :orders
  
  validates :catagory, :condition, :price, :description, :image_url, presence: true

end
