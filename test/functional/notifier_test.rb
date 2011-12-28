require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_received" do
    mail = Notifier.order_received(orders(:one))
    assert_equal "Street Heart Order Confirmation", mail.subject
    assert_equal ["dave@example.com"], mail.to
    assert_equal ["info@streetheart.com"], mail.from
    assert_match /1 x Apex Twin/, mail.body.encoded
  end

  test "order_shipped" do
    mail = Notifier.order_shipped(orders(:one))
    assert_equal "Street Heart Order Shipped", mail.subject
    assert_equal ["dave@example.com"], mail.to
    assert_equal ["info@streetheart.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Apex Twin<\/td>/, mail.body.encoded
  end

end
