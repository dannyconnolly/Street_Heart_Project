class StoreController < ApplicationController
	skip_before_filter :authorize
  before_filter :authenticate, :only => :show
	
  def index
    @products = Product.all
    @cart = current_cart
    @wishlist = current_wishlist
  end
end
