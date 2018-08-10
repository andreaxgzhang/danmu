class Slide < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :comments
end
