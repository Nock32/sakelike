require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '日本酒新規登録' do
    context '登録内容に問題がない場合' do
      it '必要事項を入力すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '登録内容に問題ある場合' do
      it 'ユーザーが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Userを入力してください'
      end
      it '酒蔵が紐付いていないと保存できない' do
        @item.brewer = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Brewerを入力してください'
      end

      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Imageを入力してください'
      end

      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Nameを入力してください'
      end

      it 'nameの文字数が41文字以上だと登録できない' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Name商品名が長すぎます'
      end

      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Explanationを入力してください'
      end

      it 'explanationが1001文字以上では登録できない' do
        @item.explanation = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Explanation商品の説明文が長すぎます'
      end
    end
  end
end
