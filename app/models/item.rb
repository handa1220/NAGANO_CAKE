class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  has_many :order_details
  belongs_to :genre

  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def get_image(width,height)
    image.variant(resize_to_limit: [width,height]).processed
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
