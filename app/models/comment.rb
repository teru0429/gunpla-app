class Comment < ApplicationRecord
  # ↓↓アソシエーション↓↓
  belongs_to :tweet
  belongs_to :user

  # ↓↓バリデーション↓↓
  validates :text, presence: true
end
