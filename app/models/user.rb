class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: true }

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: '全角ひらがな、全角カタカナ、漢字で入力してください' } do
      validates :family_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力してください' } do
      validates :family_name_kana
      validates :first_name_kana
    end

    validates :birthday

    validates :password, length: { minimum: 6, message: 'は６文字以上入力してください' },
                        format: { with: /[a-z]{1,}[0-9]{1,}/, message: 'は半角アルファベットと数字をそれぞれ１文字以上入力してください' }
  end
end
