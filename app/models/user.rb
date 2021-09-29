class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :registerable

  has_many :orders
  has_one :cart

  def name
    full_name = [first_name, last_name].join(' ')
    full_name.titleize
  end

  def shopping_cart
    if cart.present?
      cart
    else
      Cart.create(:user_id => id)
    end
  end
end
