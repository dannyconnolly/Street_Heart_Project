#
 #  Classname e.g. review.rb
 #
 #  Version information e.g. Rev 1
 #
 #
 #  @author Danny Connolly, x11105810
 #
 #
class Review < ActiveRecord::Base
  belongs_to :product, :dependent => :destroy
  belongs_to :user
  validates_presence_of :user_id, :body
  validates :body

end
