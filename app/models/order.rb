class Order < ActiveRecord::Base
  PAYMENT_TYPES =[ "Check", "Credit Card", "Purchase Order"]
end
