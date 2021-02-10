class Room < ApplicationRecord
  # ↓↓アソシエーション↓↓
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :chats,      dependent: :destroy
end
