 #
 #
 # @reference http://railscasts.com/episodes/142-paypal-notifications
 #
 #
class PaymentNotification < ActiveRecord::Base
  belongs_to :cart
  serialize :params
  after_create :mark_cart_as_purchased

   # @reference http://railscasts.com/episodes/142-paypal-notifications
  private
  def mark_cart_as_purchased
  if status == "Completed"
    cart.update_attribute(:purchased_at, Time.now)
  end
end
end
