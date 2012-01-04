#
 #  Classname category.rb
 #
 #  Version information e.g. Rev 1
 #
 #
 #  @author Danny Connolly, x11105810
 #
 #
class Category < ActiveRecord::Base
  default_scope :include => :products
  has_many :products, :dependent => :destroy
end
