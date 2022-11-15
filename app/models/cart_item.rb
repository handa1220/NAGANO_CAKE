class CartItem < ApplicationRecord
  
  belongs_to :cutomer
  belongs_to :item
  
  
  def price_including_tax
    (item.price * 1.1) * amount
  end
  
end
