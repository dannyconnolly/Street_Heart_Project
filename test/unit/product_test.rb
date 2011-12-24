require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  # Replace this with your real tests.
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:unit_price].any?
  end

  test "Product price must be positive" do
    product = Product.new(:title => "My TShirt Title", :description => "yyy")
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", product.errors[:unit_price].join('; ')

    product.unit_price =1
    assert product.valid?
  end

   test "product is not valid without a unique title" do
    product = Product.new(:title => products(:ruby).title, :description => "yyy", :unit_price => 1, :image_url => "2fred.gif")
    assert !product.save
    assert_equal "has already been taken", product.errors[:title].join('; ')
  end
end

