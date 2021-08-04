class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_one :cart

  def name
    [first_name, last_name].join(' ')
  end

  def shopping_cart
    if cart.present?
      cart
    else
      Cart.create(:user_id => id)
    end
  end
end
