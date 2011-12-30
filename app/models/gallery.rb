class Gallery < ActiveRecord::Base
  attr_accessible :image, :user_id
  mount_uploader :image, GalleryUploader

  belongs_to :user
end