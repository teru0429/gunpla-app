require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    @message = FactoryBot.build(:chat)
  end

  describe 'メッセージ入力時' do

    context 'メッセージが入力できている時' do
      it 'messageが入力されていて保存できること' do
        expect(@message).to be_valid
      end
    end

    context 'メッセージが入力できていない時' do
      it 'messageが空では保存できないこと' do
        @message.message = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Message can't be blank")
      end

      it 'roomが紐付いていないと保存できないこと' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end

      it 'userが紐付いていないと保存できないこと' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
    end
  end
end
