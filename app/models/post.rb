class Post < ActiveRecord::Base
  validates_presence_of :body, :title
  mount_uploader :image, ImageUploader
  mount_uploader :image2, Image2Uploader
  mount_uploader :image3, Image3Uploader



end
