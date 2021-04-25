class Brewer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  
  belongs_to :user
  has_many :items, foreign_key: :brewer_id, dependent: :destroy
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40, too_long: 'が長すぎます' } 
    validates :explanation, length: { maximum: 1000, too_long: 'が長すぎます' }
    validates :address, length: { maximum: 40, too_long: 'が長すぎます' } 
    validates :area_id
  end
  validates :area_id, numericality: { other_than: 1 } 

end
