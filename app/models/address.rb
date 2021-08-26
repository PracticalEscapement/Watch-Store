class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :address_type, presence: true

  def full_address
    "#{first_name.titleize} #{last_name.titleize} #{street_address} #{city.titleize} #{state.upcase} #{zip_code}"
  end

end
