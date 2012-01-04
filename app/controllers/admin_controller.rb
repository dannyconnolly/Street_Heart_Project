class AdminController < ApplicationController
   # @reference Agile Web Develoment with Rails book pg 194
  def index
	    @total_orders = Order.count
  end

end
