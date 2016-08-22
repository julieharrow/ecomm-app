class Cart < ActiveRecord::Base
  validates :user, presence: true
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def subtotal
    line_items.to_a.sum {|item| item.total_price} # .sum is a rails specific method
  end

  def add_product(product_id)
    if current_item = line_items.find_by(product_id: product_id)
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id) # .build is an alias of .new
    end
    current_item
  end

end
