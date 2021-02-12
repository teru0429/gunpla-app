require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe '作品の保存' do
    context "作品が保存できる場合" do
      it "全て入力が出来ていれば作品は保存される" do
        expect(@tweet).to be_valid
      end

      it "imageとtitleとtextのみ入力されていれば作品は保存される" do
        @tweet.text1 = ""
        @tweet.text2 = ""
        @tweet.text3 = ""
        @tweet.text4 = ""
        expect(@tweet).to be_valid
      end

      it "text1以外全て入力していれば作品は保存される" do
        @tweet.text1 = ""
        expect(@tweet).to be_valid
      end
      it "text1とtext2以外全て入力していれば作品は保存される" do
        @tweet.text1 = ""
        @tweet.text2 = ""
        expect(@tweet).to be_valid
      end
      it "text1とtext2以外全て入力していれば作品は保存される" do
        @tweet.text1 = ""
        @tweet.text3 = ""
        expect(@tweet).to be_valid
      end
      it "text1とtext2以外全て入力していれば作品は保存される" do
        @tweet.text1 = ""
        @tweet.text4 = ""
        expect(@tweet).to be_valid
      end
      it "text1とtext2とtext3以外全て入力していれば作品は保存される" do
        @tweet.text1 = ""
        @tweet.text2 = ""
        @tweet.text3 = ""
        expect(@tweet).to be_valid
      end
      it "text1とtext2とtext4以外全て入力していれば作品は保存される" do
        @tweet.text1 = ""
        @tweet.text2 = ""
        @tweet.text4 = ""
        expect(@tweet).to be_valid
      end

      it "text2以外全て入力していれば作品は保存される" do
        @tweet.text2 = ""
        expect(@tweet).to be_valid
      end
      it "text2とtext3以外全て入力していれば作品は保存される" do
        @tweet.text2 = ""
        @tweet.text3 = ""
        expect(@tweet).to be_valid
      end
      it "text2とtext4以外全て入力していれば作品は保存される" do
        @tweet.text2 = ""
        @tweet.text4 = ""
        expect(@tweet).to be_valid
      end
      it "text2とtext3とtext4以外全て入力していれば作品は保存される" do
        @tweet.text2 = ""
        @tweet.text3 = ""
        @tweet.text4 = ""
        expect(@tweet).to be_valid
      end

      it "text3以外全て入力していれば作品は保存される" do
        @tweet.text3 = ""
        expect(@tweet).to be_valid
      end
      it "text3とtext4以外全て入力していれば作品は保存される" do
        @tweet.text3 = ""
        @tweet.text4 = ""
        expect(@tweet).to be_valid
      end

      it "text4以外全て入力していれば作品は保存される" do
        @tweet.text4 = ""
        expect(@tweet).to be_valid
      end
    end

    context "作品が保存できない場合" do
      it "imageがないとツイートは保存できない" do
        @tweet.images = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Images can't be blank")
      end
      it "titleがないと作品は保存できない" do
        @tweet.title = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end
      it "textがないとツイートは保存できない" do
        @tweet.text = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end
      it "ユーザーが紐付いていないとツイートは保存できない" do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("User must exist")
      end
    end
  end
end

