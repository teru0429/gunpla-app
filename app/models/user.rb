class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  
  # ↓↓投稿に関するアソシエーション↓↓
  has_many :tweets
  has_many :comments
  # ↑↑投稿に関するアソシエーション↑↑
  
  # ↓↓チャットに関するアソシエーション↓↓
  has_many :room_users, dependent: :destroy
  has_many :rooms,      through:   :room_users
  has_many :chats,      dependent: :destroy
  # ↑↑チャットに関するアソシエーション↑↑

  # ↓↓バリデーション↓↓
  validates :nickname,       presence: true
end
