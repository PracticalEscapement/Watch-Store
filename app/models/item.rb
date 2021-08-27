class Item < ApplicationRecord

  has_many :orders
  
  validates :catagory, :condition, :price, :description, :image_url, presence: true

  def price_in_dollars
    price / 100
  end

end
