#
 #  Classname gallery.rb
 #
 #  Version information e.g. Rev 1
 #
 #
 #  @author Danny Connolly, x11105810
 #
 #
class Gallery < ActiveRecord::Base
  attr_accessible :image, :user_id
  mount_uploader :image, GalleryUploader

  belongs_to :user
end