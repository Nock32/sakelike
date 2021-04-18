require 'rails_helper'
RSpec.describe Brewer, type: :model do
  before do
    @brewer = FactoryBot.build(:brewer)
  end

  describe '酒蔵の新規登録' do
    context '登録内容に問題がない場合' do
      it '必要事項を入力すれば登録できる' do
        expect(@brewer).to be_valid
      end
    end

    context '登録内容に問題ある場合' do
      it 'ユーザーが紐付いていないと保存できない' do
        @brewer.user = nil
        @brewer.valid?
        expect(@brewer.errors.full_messages).to include'Userを入力してください'
      end

      it 'imageが空だと登録できない' do
        @brewer.image = nil
        @brewer.valid?
        expect(@brewer.errors.full_messages).to include "Imageを入力してください"
      end

      it 'nameが空だと登録できない' do
        @brewer.name = nil
        @brewer.valid?
        expect(@brewer.errors.full_messages).to include "Nameを入力してください"
      end

      it 'nameの文字数が41文字以上だと登録できない' do
        @brewer.name = Faker::Lorem.characters(number: 41)
        @brewer.valid?
        expect(@brewer.errors.full_messages).to include 'Nameが長すぎます'
      end

      it 'explanationが空では登録できない' do
        @brewer.explanation = nil
        @brewer.valid?
        expect(@brewer.errors.full_messages).to include "Explanationを入力してください"
      end

      it 'explanationが1001文字以上では登録できない' do
        @brewer.explanation = Faker::Lorem.characters(number: 1001)
        @brewer.valid?
        expect(@brewer.errors.full_messages).to include 'Explanationが長すぎます'
      end
      it 'addressが空では登録できない' do
        @brewer.address = nil
        @brewer.valid?
        expect(@brewer.errors.full_messages).to include "Addressを入力してください"
      end

      it 'addressが41文字以上では登録できない' do
        @brewer.address = Faker::Lorem.characters(number: 41)
        @brewer.valid?
        expect(@brewer.errors.full_messages).to include 'Addressが長すぎます'
      end

      it 'area_idが空では登録できない' do
        @brewer.area_id = nil
        @brewer.valid?
        expect(@brewer.errors.full_messages).to include "Areaを入力してください"
      end

      it 'area_idが1では登録できない' do
        @brewer.area_id = '1'
        @brewer.valid?
        expect(@brewer.errors.full_messages).to include 'Areaは1以外の値にしてください'
      end

    end
  end
end