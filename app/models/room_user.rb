class RoomUser < ApplicationRecord
  # ↓↓アソシエーション↓↓
  belongs_to :user
  belongs_to :room

  # ↓↓バリデーション↓↓
  validates :name, presence: true
end
