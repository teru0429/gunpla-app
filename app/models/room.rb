class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :chats,      dependent: :destroy
end
