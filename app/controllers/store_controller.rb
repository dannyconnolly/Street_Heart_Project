class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    @categories = Category.all
    @product = Product.limit(5)
  end


end
