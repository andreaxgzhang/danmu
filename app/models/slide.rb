class Slide < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :comments
  def next
    Slide.where('id > ?', id).first
  end

  def previous
    Slide.where('id < ?', id).last
  end
end
