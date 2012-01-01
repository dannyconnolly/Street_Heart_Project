class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    @categories = Category.all
    @cart = current_cart
    @wishlist = current_wishlist
    @products = Product.search(params[:search])
  end


end
