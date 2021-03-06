class User < ApplicationRecord
  has_many :pictures
  mount_uploader :user_image, ImageUploader
  validates :name, presence: true, length:{ maximum: 30 }
  validates :email, presence: true, length:{ maximum: 200 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  before_validation { email.downcase! }
  has_secure_password
  validates :password_digest, presence: true, length:{ minimum: 6 }
end
