class TagsController < ApplicationController
  skip_before_filter :authorize, :authenticate

  def show
      @products = Product.limit(3)
    @categories = Category.all


    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @tag }
    end
  end

end
