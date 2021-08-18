class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :owner, polymorphic: true
end
