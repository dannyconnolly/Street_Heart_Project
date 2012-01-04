#
#
# @reference Laptoshop Tutorial, Wesley Gorman
#
#
class WelcomeController < ApplicationController
  skip_before_filter :authorize

  def home
  end

  def about
  end

end
