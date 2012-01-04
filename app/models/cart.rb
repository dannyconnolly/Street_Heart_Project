class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:product_id => product_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def total_items
    line_items.sum(:quantity)
  end

  #  @reference http://railscasts.com/episodes/141-paypal-basics
  def paypal_url(return_url, notify_url)
    values = {
        :business => 'dannyc_1325683019_biz@gmail.com',
        :cmd => '_cart',
        :upload => 1,
        :return => return_url,
        :invoice => id,
        :notify_url => notify_url
    }
    line_items.each_with_index do |item, index|
      values.merge!({
                        "amount_#{index+1}" => item.product.unit_price,
                        "item_name_#{index+1}" => item.product.title,
                        "item_number_#{index+1}" => item.id,
                        "quantity_#{index+1}" => item.quantity
                    })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end


end
