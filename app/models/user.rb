class User < ApplicationRecord
  validates :name, presence: true, length:{ maximum: 30 }
  validates :email, presence: true, length:{ maximum: 200 ),
    format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: true
end
