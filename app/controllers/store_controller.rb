class StoreController < ApplicationController
	skip_before_filter :authorize
	
  def index
    @products = Product.all
    @cart = current_cart
    @wishlist = current_wishlist
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

end
