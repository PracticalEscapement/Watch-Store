class Item < ApplicationRecord

  validates :catagory, :condition, :price, :description, :image_url, presence: true

end
