class Product < ActiveRecord::Base
	belongs_to :user

  default_scope :order => 'title'

  #validation...
  validates :title, :description, :image_url, :presence => true
  validates :unit_price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
      :with => %r{\.(gif|jpg|png)$}i,
      :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
