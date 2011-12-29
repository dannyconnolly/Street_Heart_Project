require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products

  # A user goes to the store page. They select a product, adding it to their cart and check out, filling
  #in their details on the checkout form. When they submit, an order is created containing their information
  #along with a single line item corresponding to the product they added to their cart.

  test "Buying a Product" do
    LineItem.delete_all
    Order.delete_all
    streetheart_tee = products(:ruby)

    get "/store"
    assert_response :success
    assert_template "store"

    xml_http_request :post, '/line_items', :product_id => streetheart_tee.id
    assert_response :success

    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal streetheart_tee, cart.line_items[0].product

    get "/orders/new"
    assert_response :success
    assert_template "new"

    post_via_redirect "/orders",
                      :order => { :name => "Dave Nelson",
                                  :address => "123 Alphabet Street",
                                  :email => "dave@example.com",
                                  :pay_type => "Cheque"}
    assert_response :success
    assert_template "index"
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size

    orders = Order.all
    assert_equal 1, order.size
    order = orders[0]

    assert_equal "Dave Nelson",          order.name
    assert_equal "123 Alphabet Street",  order.address
    assert_equal"dave@example.com",      order.email
    assert_equal "Cheque",               order.pay_type

    assert_equal 1, order.line_items.size
    line_item = order.line_items[0]
    assert_equal streetheart_tee, line_item.product

    mail = ActionMailer::Base.deliveries.last
    assert_equal ["dave@example.com"], mail.to
    assert_equal 'Info <info@streetheart.com>', mail[:from].value
    assert_equal "Street Heart Order Confirmation", mail.subject
  end
end
