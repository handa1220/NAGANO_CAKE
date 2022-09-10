class CartItem < ApplicationRecord
  
  belongs_to :cutomer
  belongs_to :item
  
end
