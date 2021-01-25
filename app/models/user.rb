class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  # ↓↓投稿に関するassociation↓↓
  has_many :tweets
  has_many :comments
  # ↑↑投稿に関するassociation↑↑
  
  # ↓↓チャットに関するassociation↓↓
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  # ↑↑チャットに関するassociation↑↑

  validates :nickname,       presence: true
end
