class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :cart
  belongs_to :product

  def total_price
    product.unit_price * quantity
  end
end
