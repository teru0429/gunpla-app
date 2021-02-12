class Tweet < ApplicationRecord
  # ↓↓アソシエーション↓↓
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images

  # ↓↓バリデーション↓↓
  with_options presence: true do
    validates :title
    validates :text
    validates :images
  end
end
