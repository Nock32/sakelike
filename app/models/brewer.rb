class Brewer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  
  belongs_to :user
  has_many :items , dependent: :destroy

  with_options presence: true do
    validates :name, length: { maximum: 40, too_long: '商品名が長すぎます' } 
    validates :explanation, length: { maximum: 1000, too_long: '商品の説明文が長すぎます' }
    validates :address
  end
  validates :area_id, numericality: { other_than: 1 } 

end
