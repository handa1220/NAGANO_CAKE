class OrderDetail < ApplicationRecord
  enum production_status: { not_initiated: 0, awaiting_manufacture: 1,
    under_manufacture: 2, manufacturing_completed: 3 }
    
  belongs_to :order
  
end
