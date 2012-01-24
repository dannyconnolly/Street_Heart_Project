#
#
# @reference Laptoshop Tutorial, Wesley Gorman
#
#
class WelcomeController < ApplicationController
  skip_before_filter :authorize

  def home
    @categories = Category.all
    @products = Product.limit(4)
  end

  def about
    @categories = Category.all
  end

end
