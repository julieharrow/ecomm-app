class LineItem < ActiveRecord::Base
  validates :product, presence: true
  validates :cart, presence: true
  belongs_to :product
  belongs_to :cart


  def total_price
    product.price * quantity
  end
end
