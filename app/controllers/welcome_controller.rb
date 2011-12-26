class WelcomeController < ApplicationController
  skip_before_filter :authorize
  
  def home
    @wishlist = current_wishlist
    @cart = current_cart
  end

  def about
  end

end
