class StoreController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :authenticate

  def index
    @categories = Category.all
    @products = Product.all
    @cart = current_cart
    @wishlist = current_wishlist
  end



end
