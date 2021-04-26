require 'rails_helper'
RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe '酒蔵の新規登録' do
    context '登録内容に問題がない場合' do
      it '必要事項を入力すれば登録できる' do
        expect(@review).to be_valid
      end
    end

    context '登録内容に問題ある場合' do
      it 'ユーザーが紐付いていないと保存できない' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include 'Userを入力してください'
      end
      it '日本酒の情報が紐付いていないと保存できない' do
        @review.item = nil
        @review.valid?
        expect(@review.errors.full_messages).to include 'Itemを入力してください'
      end

      it 'titleが空だと登録できない' do
        @review.title = nil
        @review.valid?
        expect(@review.errors.full_messages).to include 'Titleを入力してください'
      end

      it 'titleの文字数が41文字以上だと登録できない' do
        @review.title = Faker::Lorem.characters(number: 41)
        @review.valid?
        expect(@review.errors.full_messages).to include 'Titleが長すぎます'
      end

      it 'contentが空では登録できない' do
        @review.content = nil
        @review.valid?
        expect(@review.errors.full_messages).to include 'Contentを入力してください'
      end

      it 'contentが1001文字以上では登録できない' do
        @review.content = Faker::Lorem.characters(number: 1001)
        @review.valid?
        expect(@review.errors.full_messages).to include 'Contentが長すぎます'
      end
    end
  end
end
