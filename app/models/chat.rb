class Chat < ApplicationRecord
    # ↓↓アソシエーション↓↓
  belongs_to :user
  belongs_to :room

  # ↓↓バリデーション↓↓
  validates :message, presence: true
end
