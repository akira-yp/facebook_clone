class Picture < ApplicationRecord
  validates :content, presence: true, length:{in: 1..500}
  mount_uploader :image, ImageUploader
  belongs_to :user
end
