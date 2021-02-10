class Tweet < ApplicationRecord
  # ↓↓アソシエーション↓↓
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images

  # ↓↓バリデーション↓↓
  validates :title, presence: true
  validates :text,  presence: true
end
