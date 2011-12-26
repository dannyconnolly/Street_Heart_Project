class Category < ActiveRecord::Base
  default_scope :include => :products
  has_many :products, :dependent => :destroy
end
