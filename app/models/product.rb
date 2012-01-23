class Product < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tags
  scope :by_join_date, order("created_at DESC")

  belongs_to :category
  has_many :reviews, :dependent => :destroy
  attr_accessible :productimage, :title, :description, :unit_price, :category_id, :tag_list
  mount_uploader :productimage, ProductImageUploader
	belongs_to :user

  default_scope :order => 'title'
  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :wishlist_items

  before_destroy :ensure_not_referenced_by_any_wishlist_item
  before_destroy :ensure_not_referenced_by_any_line_item

  #validation...
  validates :title, :description, :presence => true
  validates :unit_price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def five_recent_products
    products = Product.where("created_at <= ?", Time.now)
  end

  private

  #ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line items present')
      return false
    end
  end

  def ensure_not_referenced_by_any_wishlist_item
    if wishlist_items.empty?
      return true
    else
      errors.add(:base, 'Wishlist Items present')
      return false
    end
  end
end
