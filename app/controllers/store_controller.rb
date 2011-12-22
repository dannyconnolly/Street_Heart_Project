class StoreController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :authenticate

  def index
    @products = Product.all
    @cart = current_cart
    @wishlist = current_wishlist
  end



end
