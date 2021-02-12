require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room_user = FactoryBot.build(:room_user)
  end

  describe 'ルーム作成' do

    context 'ルーム作成ができる時' do
      it "nameの値が存在すれば登録できること" do
        expect(@room_user).to be_valid
      end
    end

    context 'ルーム作成ができる時' do
      it "nameが空では登録できないこと" do
        @room_user.name = nil
        @room_user.valid?
        expect(@room_user.errors.full_messages).to include("Name can't be blank")
      end
    end
  end

end
