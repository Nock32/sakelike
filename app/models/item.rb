class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40, too_long: '商品名が長すぎます' } 
    validates :explanation, length: { maximum: 1000, too_long: '商品の説明文が長すぎます' }
  end
  
end