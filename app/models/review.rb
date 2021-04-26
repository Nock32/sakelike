class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user

  with_options presence: true do
    validates :title, length: { maximum: 40, too_long: 'が長すぎます' }
    validates :content, length: { maximum: 1000, too_long: 'が長すぎます' }
  end
end
